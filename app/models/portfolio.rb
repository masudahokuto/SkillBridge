class Portfolio < ApplicationRecord
  belongs_to :user

  enum visibility: { public: 0, private: 1, followers_only: 2 }
end
