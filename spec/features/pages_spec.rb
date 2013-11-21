require 'spec_helper'

feature "Pages" do
  
  subject { page }

  describe "Home page" do
    before { visit '/' }

    context "should have the h1 'Chirp'" do
      it { should have_selector('h1', text: 'Chirp') }
    end
  end

  describe "Help page" do
    before { visit '/pages/help' }
    
    context "should have the h1 'Help'" do
      it { should have_selector('h1', text: 'Help') }
    end
  end

  describe "About page" do
    before { visit '/pages/about' }

    context "should have the h1 'About'" do
      it { should have_selector('h1', text: 'About') }
    end
  end

  describe "Contact page" do
    before { visit '/pages/contact' }

    context "should have the h1 'contact'" do
      it { should have_selector('h1', text: 'Contact') }
    end
  end
end
