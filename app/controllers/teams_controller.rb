class TeamsController < ApplicationController
  def show
    @team = Team.find_by_domain!(params[:domain])
  end
end
