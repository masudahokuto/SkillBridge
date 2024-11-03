class UserTagging < ApplicationRecord
  belongs_to :user
  belongs_to :skill_tag
end
