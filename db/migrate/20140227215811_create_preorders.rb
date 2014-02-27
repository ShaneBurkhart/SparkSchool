class CreatePreorders < ActiveRecord::Migration
  def change
    create_table :preorders do |t|
      # General info
      t.string :first_name
      t.string :last_name
      t.string :email

      # Shipping Info
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      # Credit info
      t.string :strip_customer_id

      t.timestamps
    end
  end
end
