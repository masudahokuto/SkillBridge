class SkillTag < ApplicationRecord
  has_many :user_taggings, dependent: :destroy
  has_many :portfolio_taggings, dependent: :destroy

  has_many :users, through: :user_taggings
  has_many :portfolio_taggings
  has_many :portfolios, through: :portfolio_taggings

  has_one_attached :skill_tag_image

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }

  scope :by_usage, -> {
    left_joins(:portfolios)
      .group(:id)
      .order('COUNT(portfolios.id) DESC')
  }

  private

  def validate_skill_tag_image
    if skill_tag_image.attached?
      if !skill_tag_image.content_type.in?(%w[image/png image/jpg image/jpeg])
        errors.add(:skill_tag_image, 'の形式が不正です。PNG、JPG、JPEG のみが許可されています。')
      elsif skill_tag_image.byte_size > 5.megabytes
        errors.add(:skill_tag_image, 'のサイズは5MB以下である必要があります。')
      end
    else
      errors.add(:skill_tag_image, 'を選択してください。')
    end
  end
end
