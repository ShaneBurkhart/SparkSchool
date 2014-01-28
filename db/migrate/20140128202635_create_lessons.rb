class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :unit_id
      t.string :name
      t.text :description
      t.integer :lesson_number

      t.timestamps
    end
  end
end
