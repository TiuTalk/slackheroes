class PagesController < ApplicationController
  def home
    @team = Team.joins(:users).order('RANDOM()').first

    redirect_to(@team) if @team.present?
  end
end
