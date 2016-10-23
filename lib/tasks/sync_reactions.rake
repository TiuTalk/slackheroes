namespace :sync do
  task emojis: [:environment] do
    Team.find_each do |team|
      UsersImporterJob.perform_later(team)
      CustomEmojiImporterJob.perform_later(team)
    end
  end
end
