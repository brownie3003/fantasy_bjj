require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

     it "should have the content 'BJJ Fantasy Game'" do
      visit '/'
      expect(page).to have_content('BJJ Fantasy Game')
    end
  end
end
