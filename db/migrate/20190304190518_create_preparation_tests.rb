class CreatePreparationTests < ActiveRecord::Migration[5.2]
  def change
    create_table :preparation_tests do |t|
      t.string :name
    end
  end
end
