FactoryGirl.define do
  factory :custom_emoji do
    sequence(:name) { |n| ":smile::#{n}" }
    url "http://hills.com/tempore-atque-nam-nostrum-quam-molestias-vel-enim-sed"
  end
end
