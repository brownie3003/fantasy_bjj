require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'BJJ Fantasy Game'" do
      visit '/'
      expect(page).to have_content('BJJ Fantasy League')
    end

    it "should have the title 'Home'" do
      visit '/'
      expect(page).to have_title('Home')
    end
  end
end
