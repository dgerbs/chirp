require 'spec_helper'

describe "Authentication pages" do
  
  subject { page }

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "submitting to the update action" do
          before { put user_path(user) }
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
