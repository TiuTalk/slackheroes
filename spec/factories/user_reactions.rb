FactoryGirl.define do
  factory :user_reaction do
    user
    message_uid { SecureRandom.hex(5) }
    action 'sent'
  end
end
