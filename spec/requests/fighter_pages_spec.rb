require 'spec_helper'

describe "Fighter pages" do

    subject { page }

    describe "create fighter page" do
        before { visit new_fighter_path }

        let(:submit) { "Add Fighter" }

        describe "with invalid information" do
            it "should not add a fighter" do
                expect { click_button submit }.not_to change(Fighter, :count)
            end
        end

        describe "with valid information" do
            before do
                fill_in "Name",             with: "Bill Cooper"
                fill_in "Nickname",         with: "The Grill"
                find("#fighter_weight").set("Ultra Heavy")
                fill_in "Date of birth",    with: "1988-12-12"
                fill_in "Team affiliation", with: "Paragon"
            end

            it "should add a fighter" do
                expect { click_button submit }.to change(Fighter, :count).by(1)
            end

            describe "after saving the fighter" do
                before { click_button submit }
                let(:fighter) { Fighter.find_by(name: "Bill Cooper") }

                it { should have_content(fighter.name) }
            end
        end
    end
end