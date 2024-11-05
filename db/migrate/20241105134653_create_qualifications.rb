class CreateQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :qualifications do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :qualifications, [:user_id, :name], unique: true
  end
end
