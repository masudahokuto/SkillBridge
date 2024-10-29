class CreateUserDitails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_ditails do |t|
      t.references :user, null: false, foreign_key: true
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :phone, null: false
      t.text :address, null: false
      t.string :post_code, null: false

      t.timestamps
    end
  end
end
