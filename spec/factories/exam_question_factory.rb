FactoryBot.define do
  factory :exam_question do
    title { Faker::Name.unique.name }
    body { Faker::String.random(10) }
  end
end
