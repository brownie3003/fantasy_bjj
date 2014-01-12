require 'spec_helper'

describe "User pages" do

    subject { page }

    describe "signup page" do
        before { visit signup_path }

        let(:submit) { "Create Account" }

        describe "with invalid information" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count)
            end
        end

        describe "with valid informtaion" do
            before do
                fill_in "Username",        with: "ExampleUsername27"
                # Use find and ID because of the Email & Password form in the header for quick signin confuses capybara
                find("#user_email").set('user@example.com')
                find("#user_password").set("foobar")
                fill_in "Confirmation",     with: "foobar"
            end

            it "should create a user" do
                expect { click_button submit }.to change(User, :count).by(1)
            end

            describe "after saving the user" do
                before { click_button submit }
                let(:user) { User.find_by(email: 'user@example.com') }

                it { should have_link('Sign out') }
                it { should have_title(user.name) }
                it { should have_selector('div.alert.alert-success', text: "Osss") }
            end

            describe "followed by signout" do
                before { click_link "Sign out" }
                it { should have_link('Sign in') }
            end
        end

        it { should have_content('Sign up') }
        it { should have_title(full_title('Sign up')) }
    end

    describe "profile page" do
        let(:user)  { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_content(user.name) }
        it { should have_title(user.name) }
    end
end