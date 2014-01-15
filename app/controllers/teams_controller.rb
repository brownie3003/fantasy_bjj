class TeamsController < ApplicationController
    def show
        @user = current_user
        @team = @user.team
    end

    def create
    end
end
