require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('BJJ') }
    it { should have_title("BJJ Fantasy League") }
    it { should_not have_title('| Home') }
  end
end
