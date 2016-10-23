class TeamsController < ApplicationController
  def show
    @team = Team.find_by_domain!(params[:id])

    render 'loading' if @team.user_reactions.count < 100
  end
end
