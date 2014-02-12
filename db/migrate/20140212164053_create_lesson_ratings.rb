class CreateLessonRatings < ActiveRecord::Migration
  def change
    create_table :lesson_ratings do |t|

      t.timestamps
    end
  end
end
