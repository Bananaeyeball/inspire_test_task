class CreatePreparationQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :preparation_questions do |t|
      t.string :title
      t.text :body
      t.text :hint
      t.integer :use_count, default: 0
    end
  end
end
