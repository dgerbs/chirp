require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }
 
    context "should have the h1 'Sign up'" do
      it { should have_selector('h1', text: 'Sign up') }
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }    
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
  end
end
