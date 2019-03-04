class CreateExamQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_questions do |t|
      t.string :title
      t.text :body
      t.text :explanation
      t.integer :exam_id, foreign_key: true
    end
  end
end
