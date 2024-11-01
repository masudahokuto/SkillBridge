class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :portfolio_url, null: false
      t.string :github_link
      t.integer :visibility, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end