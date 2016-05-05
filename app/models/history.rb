class History < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :user, :food, presence: true
end
