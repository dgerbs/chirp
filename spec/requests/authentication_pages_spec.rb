require 'spec_helper'

describe "Authentication pages" do
  
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    context "should have the h1 'Sign in'" do 
      it { should have_selector('h1', text: 'Sign in') }
    end
  end
end
