class CreateIncomingMails < ActiveRecord::Migration
  def change
    create_table :incoming_mails do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
