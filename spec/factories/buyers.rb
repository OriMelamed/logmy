FactoryBot.define do
    factory :buyer do
      name { Faker::Company.name }
    end
end