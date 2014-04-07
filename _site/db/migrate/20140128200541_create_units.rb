class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :course_id
      t.string :name
      t.integer :unit_number

      t.timestamps
    end
  end
end
