class SkillTag < ApplicationRecord
  has_many :user_taggings, dependent: :destroy
  has_many :portfolio_taggings, dependent: :destroy

  has_many :users, through: :user_taggings
  has_many :portfolio_taggings
  has_many :portfolios, through: :portfolio_taggings

  has_one_attached :skill_tag_image

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :skill_tag_image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

  scope :by_usage, -> {
    left_joins(:portfolios)
      .group(:id)
      .order('COUNT(portfolios.id) DESC')
  }
end
