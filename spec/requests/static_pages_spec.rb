require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Pre Wake" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Pre Wake') }
    it { should have_content('A pre Wake app where friends can post what they will miss about you before you "kick the bucket".') }
    it { should have_title(full_title('Pre Wake')) }

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
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end
  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title("About")) }
  end
  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title("Contact")) }
  end
end
