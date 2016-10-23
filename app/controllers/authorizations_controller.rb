class AuthorizationsController < ApplicationController
  def authorize
    team_data = request.env['omniauth.auth']['extra']['team_info']['team']
    team = Team.where(slack_id: team_data['id']).first_or_initialize
    team.name = team_data['name']
    team.domain = team_data['domain']
    team.email_domain = team_data['email_domain']
    team.image = team_data['icon']['image_original']
    team.token = request.env['omniauth.auth']['credentials']['token']
    if team.new_record?
      flash[:notice] = 'Your team is authorized successfully. We are importing your team data. Check back this page in a few minutes.'
    else
      flash[:notice] = 'Your team was already authorized.'
    end
    team.save
    redirect_to team_path(team)
  end
end
