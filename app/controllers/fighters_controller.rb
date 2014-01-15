class FightersController < ApplicationController

    def new
        @fighter = Fighter.new
    end

    def create
        @fighter = Fighter.new(fighter_params)
        if @fighter.save
            flash[:success] = "New Fighter Added"
            redirect_to @fighter
        else
            render 'new'
        end
    end

    def show
        @fighter = Fighter.find(params[:id])
    end

    private

        def fighter_params
            params.require(:fighter).permit(:name, :nickname, :weight, :date_of_birth, :team_affiliation)
        end
end
