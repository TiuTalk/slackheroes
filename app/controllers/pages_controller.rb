class PagesController < ApplicationController
  def home
    @team = Team.order('RANDOM()').first

    redirect_to(@team) if @team.present?
  end
end
