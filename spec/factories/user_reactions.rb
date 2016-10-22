FactoryGirl.define do
  factory :user_reaction do
    association :sender, factory: :user
    association :receiver, factory: :user
    message_uid { SecureRandom.hex(5) }
    emoji ":smile:"
  end
end
