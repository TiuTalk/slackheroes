class PagesController < ApplicationController
  def home
    @team = Team.joins(:users).order('RANDOM()').first
  end
end
