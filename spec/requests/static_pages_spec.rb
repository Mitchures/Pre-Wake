require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Pre Wake" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Pre Wake') }
    it { should have_title(full_title("")) }
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
