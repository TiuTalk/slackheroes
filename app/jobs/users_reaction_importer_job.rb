class UsersReactionImporterJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      ReactionsImporterJob.perform_later(user, 1)
    end
  end
end
