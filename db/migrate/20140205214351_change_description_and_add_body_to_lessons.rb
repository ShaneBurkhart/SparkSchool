class ChangeDescriptionAndAddBodyToLessons < ActiveRecord::Migration
  def change
    change_column :lessons, :description, :string
    add_column :lessons, :body, :text
  end
end
