require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Pre Wake'" do
      visit '/static_pages/home'
      expect(page).to have_content('Pre Wake')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Pre Wake | Home")
    end
  end
  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("Pre Wake | About")
    end
  end
  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
  end
end
