FactoryGirl.define do
  factory :user_reaction do
    user
    emoji
    message_uid { SecureRandom.hex(5) }
    action 'sent'
  end
end
