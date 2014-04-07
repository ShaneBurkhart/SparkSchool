class CreateNewsletterUsers < ActiveRecord::Migration
  def change
    create_table :newsletter_users do |t|
      t.string :email, unique: true

      t.timestamps
    end
  end
end
