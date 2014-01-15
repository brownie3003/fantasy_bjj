require 'spec_helper'

describe Fighter do
    
    let(:user) { FactoryGirl.create(:user) }
    before do
        @fighter = Fighter.new(name: "Ronaldo Souza", nickname: "Jacare", weight: "Medium", date_of_birth: "1979-12-07", team_affiliation: "X-Gym")
    end

    subject { @fighter }

    it { should respond_to(:name) }
    it { should respond_to(:nickname) }
    it { should respond_to(:weight) }
    it { should respond_to(:date_of_birth) }
    it { should respond_to(:team_affiliation) }

    it { should be_valid }

    describe "when name is not present" do
        before { @fighter.name = " " }
        it { should_not be_valid }
    end

    describe "when weight is not present" do
        before { @fighter.weight = " " }
        it { should_not be_valid }
    end

    describe "when name is already taken" do
        before do
            fighter_with_same_name = @fighter.dup
            fighter_with_same_name.name = @fighter.name.upcase
            fighter_with_same_name.save
        end

        it { should_not be_valid }
    end
end
