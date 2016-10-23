FactoryGirl.define do
  factory :team do
    sequence(:slack_id) { |n| "T026M1A#{n}" }
    sequence(:name) { |n| "HE:labs#{n}" }
    sequence(:domain) { |n| "helabs#{n}" }
  end
end
