require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    context "should have the h1 'Chirp'" do
      it { should have_selector('h1', text: 'Chirp') }
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end 

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 follower",  href: followers_user_path(user)) }
      end
    end
  end

  describe "Help page" do
    before { visit help_path }
    
    context "should have the h1 'Help'" do
      it { should have_selector('h1', text: 'Help') }
    end
  end

  describe "About page" do
    before { visit about_path }

    context "should have the h1 'About'" do
      it { should have_selector('h1', text: 'About') }
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    context "should have the h1 'Contact'" do
      it { should have_selector('h1', text: 'Contact') }
    end
  end

   describe "News page" do
    before { visit news_path }

    context "should have the h1 'News'" do
      it { should have_selector('h1', text: 'News') }
    end
  end
  
end
