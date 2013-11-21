require 'spec_helper'

describe "Pages" do
  describe "Home page" do
    it "should have the content 'Chirp'" do
      visit '/pages/home'
      page.should have_content('Chirp')
    end
  end
end
