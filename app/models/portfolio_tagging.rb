class PortfolioTagging < ApplicationRecord
  belongs_to :portfolio
  belongs_to :skill_tag
end
