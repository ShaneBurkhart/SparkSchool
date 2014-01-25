class CreateBetaUsers < ActiveRecord::Migration
  def change
    create_table :beta_users do |t|
      t.string :email, unique: true
      t.string :sign_up_form

      t.timestamps
    end
  end
end
