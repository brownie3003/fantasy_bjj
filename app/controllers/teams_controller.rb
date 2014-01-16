class TeamsController < ApplicationController
    def show
        @user = current_user
        @team = @user.team
    end

    def create
    end

    def edit
        @user = current_user
        @team = @user.team
    end

    def update
        @user = current_user
        @team = @user.team
        if @team.update_attributes(team_params)
            flash[:success] = "Team updated"
            redirect_to @team
        else
            render 'edit'
        end
    end

    private

        def team_params
            params.require(:team).permit(:rooster_fighter_id, :light_feather_fighter_id, :feather_fighter_id, :light_fighter_id, :middle_fighter_id, :medium_heavy_fighter_id, :heavy_fighter_id, :super_heavy_fighter_id, :ultra_heavy_fighter_id)
        end
end
