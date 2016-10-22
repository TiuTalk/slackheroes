class AuthorizationsController < ApplicationController
  def authorize
    if request.env['omniauth.auth']
      team_data = request.env['omniauth.auth']['extra']['team_info']['team']
      team = Team.where(slack_id: team_data['id']).first_or_initialize
      team.name = team_data['name']
      team.domain = team_data['domain']
      team.email_domain = team_data['email_domain']
      team.image = team_data['icon']['image_original']
      team.token = request.env['omniauth.auth']['credentials']['token']
      team.save
    end
    flash[:notice] = 'Your team is authorized successfully. We are importing your team data, please check back in a few minutes'
    redirect_to root_path
  end
end
