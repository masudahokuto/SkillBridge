class SkillTag < ApplicationRecord
  has_many :user_taggings, dependent: :destroy
  has_many :portfolio_taggings, dependent: :destroy

  has_many :users, through: :user_taggings
  has_many :portfolios, through: :portfolio_taggings
end