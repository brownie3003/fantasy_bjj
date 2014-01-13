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

    describe "authorisation" do

        describe "for non-signed-in users" do
            let(:user) { FactoryGirl.create(:user) }

            describe "when attempting to visit a protected page" do
                before do
                    visit edit_user_path(user)
                    first(:css, "#session_email").set(user.email)
                    first(:css, "#session_password").set(user.password)
                    click_button "Header-Sign-in"
                end

                describe "after signing in" do

                    it "should render the desired protected page" do
                        expect(page).to have_title('Edit user')
                    end
                end
            end

            describe "in the Users controller" do

                describe "visiting the edit page" do
                    before { visit edit_user_path(user) }
                    it { should have_title('Sign in') }
                end

                describe "submitting to the update action" do
                    before { patch user_path(user) }
                    specify { expect(response).to redirect_to(signin_path) }
                end
            end
        end

        describe "as wrong user" do
            let(:user) { FactoryGirl.create(:user) }
            let(:wrong_user) { FactoryGirl.create(:user, name: "JonJones", email: "wrong@example.com") }
            before { sign_in user, no_capybara: true }

            describe "submitting a GET requestion to the Users#edit action" do
                before { get edit_user_path(wrong_user) }
                specify { expect(response.body).not_to match(full_title('Edit user')) }
                specify { expect(response).to redirect_to(root_url) }
            end

            describe "submitting a PATCH request to the Users#update action" do
                before { patch user_path(wrong_user) }
                specify { expect(response).to redirect_to(root_url) }
            end
        end
    end
end
