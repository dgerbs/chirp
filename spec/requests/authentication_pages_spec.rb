require 'spec_helper'

describe "Authentication pages" do
  
  subject { page }

  describe "authorization" do

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "submitting a delete request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(signin_path) }
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@blah.com") }
      before { sign_in user }


      describe "submitting a PUT request to the User#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(signin_path) }
      end
    end

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do
          it "should render the desired page" do
            page.should have_selector('h1', text: "Update your profile")
          end
        end
      end  

      describe "in the Users controller" do

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_selector('h1', text: "Sign in") }
        end
      end

      describe "in the Microposts controller" do
        
        describe "submitting to the create action" do
          before { post microposts_path }
          specify { response.should redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before do
            micropost = FactoryGirl.create(:micropost)
            delete micropost_path(micropost)
          end
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
  end

  describe "signin page" do
    before { visit signin_path }

    context "should have the h1 'Sign in'" do 
      it { should have_selector('h1', text: 'Sign in') }
    end

    describe "with invalid inforamtion" do
      before { click_button "Sign in" }

      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }

        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do

        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Users',    href: users_path) }
      it { should have_link('Profile',  href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      
      it { should_not have_link('Sign in',  href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end
end
