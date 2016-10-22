class UsersImporterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    active_users.each do |user|
      User.where(uid: user.id).first_or_initialize do |u|
        u.name = user.real_name
        u.username = user.name
        u.title = user.profile.title
        u.avatar = user.profile.image_192
        u.save!
      end
    end
  end

  private

  def active_users
    client = Slack::Web::Client.new
    client.users_list.members.reject { |u| ignore_user?(u) }
  end

  def ignore_user?(user)
    user.is_restricted || user.deleted || user.is_bot || user.name == 'slackbot'
  end
end
