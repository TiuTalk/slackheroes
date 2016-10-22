class UsersImporterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UserImporterService.call
  end
end
