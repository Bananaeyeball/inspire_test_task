class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :name
    end
  end
end
