FactoryGirl.define do
  factory :player do
    name {Faker::Name.name}
    goals 4
    association :team, factory: :team, strategy: :build
  end

end
