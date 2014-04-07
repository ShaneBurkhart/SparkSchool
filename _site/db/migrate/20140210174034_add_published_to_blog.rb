class AddPublishedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :published, :boolean, defaut: false
  end
end
