FactoryBot.define do
  factory :exam do
    name { Faker::Name.unique.name }

    factory :exam_with_questions do

      transient do
        question_count { 5 }
      end

      after(:build) do |exam, evaluator|
        exam.questions << create_list(:exam_question, evaluator.question_count)
      end
    end
  end
end
