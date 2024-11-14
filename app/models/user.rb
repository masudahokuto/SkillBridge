class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  enum gender: { male: 0, female: 1, other: 2 }
  enum work_experience: { no_experience: 0, less_than_3_years: 1, more_than_3_years: 2 }
  has_one :user_detail, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :user_taggings, dependent: :destroy
  has_many :skill_tags, through: :user_taggings
  has_many :qualifications, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_portfolios, through: :favorites, source: :portfolio
  accepts_nested_attributes_for :qualifications, allow_destroy: true

  def favorite(portfolio)
    favorites.find_or_create_by(portfolio_id: portfolio.id)
  end

  def favorited_by?(portfolio)
    favorites.exists?(portfolio_id: portfolio.id)
  end
end

