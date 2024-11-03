class CreatePortfolioTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_taggings do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :skill_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
