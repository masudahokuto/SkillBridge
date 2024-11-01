class Portfolio < ApplicationRecord
  belongs_to :user

  enum visibility: { is_public: 0, is_private: 1, followers_only: 2 }
end
