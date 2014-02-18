class CreateCompletedLessons < ActiveRecord::Migration
  def change
    create_table :completed_lessons do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
