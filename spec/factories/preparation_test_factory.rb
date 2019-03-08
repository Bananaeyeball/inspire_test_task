FactoryBot.define do
  factory :preparation_test do
    name { Faker::Name.unique.name }

    factory :preparation_test_with_questions do

      transient do
        question_count { 5 }
      end

      after(:build) do |preparation_test, evaluator|
        preparation_test.questions << create_list(:preparation_question,
                                                  evaluator.question_count)
      end
    end
  end
end
