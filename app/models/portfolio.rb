class Portfolio < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :skill_tags, through: :portfolio_taggings

  enum visibility: { is_public: 0, is_private: 1, followers_only: 2 }
end
