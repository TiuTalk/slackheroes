class ReactionsImporterJob < ApplicationJob
  queue_as :default

  def perform(user, page)
    ReactionsImporterService.call(user, page)
  end
end
