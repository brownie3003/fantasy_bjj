require 'spec_helper'

describe "Authentication" do

    subject { page }

    describe "signin" do
        before { visit root_path }

        describe "with invalid information" do
            before { click_button "Sign in" }

            it { should have_selector('div.alert.alert-danger') }

            describe "after visiting another page" do
                before { click_link "Fighters" }
                it { should_not have_selector('div.alert.alert-danger') }
            end
        end

        describe "with valid information" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                find("#session_email").set('user@example.com')
                find("#session_password").set("foobar")
                click_button "Sign in"
            end

            it { should have_title("BJJ Fantasy League | " + user.name) }
            it { should have_link('Profile',        href: user_path(user)) }
            it { should have_link('Sign out',       href: signout_path) }
            it { should_not have_link('Sign in',    href: signin_path) }
        end
    end
end
