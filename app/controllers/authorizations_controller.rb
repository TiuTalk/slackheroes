class AuthorizationsController < ApplicationController
  def authorize
    team = Team.find_by_slack_id(team_data['id'])
    if team
      flash[:notice] = 'Your team was already authorized.'
    else
      team = build_team
      if team.save
        UsersImporterJob.perform_later(team)
        CustomEmojiImporterJob.perform_later(team)
        flash[:notice] = 'Your team is authorized successfully. We are importing your team data. Check back this page in a few minutes.'
      end
    end
    redirect_to team_path(team.reload)
  end

  def build_team
    Team.new(
      name: team_data['name'],
      domain: team_data['domain'],
      email_domain: team_data['email_domain'],
      image: team_data['icon']['image_original'],
      token: request.env['omniauth.auth']['credentials']['token'],
      slack_id: team_data['id']
    )
  end

  def team_data
    request.env['omniauth.auth']['extra']['team_info']['team']
  end
end
