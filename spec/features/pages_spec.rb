require 'spec_helper'

describe "Pages" do
  
  describe "Home page" do
    it "should have the content 'Chirp'" do
      visit '/pages/home'
      page.should have_content('Chirp')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/pages/help'
      page.should have_content('Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/pages/about'
      page.should have_content('About')
    end
  end
end
