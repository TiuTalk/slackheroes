class UsersImporterJob < ApplicationJob
  queue_as :default

  def perform(team)
    UserImporterService.new(team).call
  end
end
