class CreateJoinTablePreparationTestsPreparationQuestions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :preparation_tests, :preparation_questions
  end
end
