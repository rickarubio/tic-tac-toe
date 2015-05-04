FactoryGirl.define do
  factory :game

  factory :player do
    sequence(:name) { |n| "Player#{n}" }
  end
end
