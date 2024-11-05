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
  has_many :skill_tags, through: :usertaggings
  has_many :qualifications, dependent: :destroy
  accepts_nested_attributes_for :qualifications, allow_destroy: true
end

