FactoryGirl.define do
  factory :user do
    uid { SecureRandom.hex(5) }
    name "John Doe"
    username "john"
    title "Awesome Developer"
    avatar "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"
    team
  end
end
