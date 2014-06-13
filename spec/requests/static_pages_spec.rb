require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Pre Wake" }

  describe "Home page" do

    it "should have the content 'Pre Wake'" do
      visit '/static_pages/home'
      expect(page).to have_content('Pre Wake')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
  end
  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end
  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
