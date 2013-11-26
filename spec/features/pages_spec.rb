require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    context "should have the h1 'Chirp'" do
      it { should have_selector('h1', text: 'Chirp') }
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
