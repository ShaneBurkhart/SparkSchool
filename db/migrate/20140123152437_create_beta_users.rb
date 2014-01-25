class CreateBetaUsers < ActiveRecord::Migration
  def change
    create_table :beta_users do |t|
      t.string :email
      t.string :sign_up_form

      t.timestamps
    end
  end
end
