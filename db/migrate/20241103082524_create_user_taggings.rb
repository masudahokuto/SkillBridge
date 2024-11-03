class CreateUserTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_taggings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
