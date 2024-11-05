class Portfolio < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :portfolio_taggings
  has_many :skill_tags, through: :portfolio_taggings
  has_one_attached :portfolio_image
  enum visibility: { is_public: 0, is_private: 1, followers_only: 2 }
end
