class Food < ApplicationRecord
  has_and_belongs_to_many :stores

  has_many :histories
  has_many :users, through: :histories

  validates :name,
            presence: true,
            uniqueness: true

  validates :calories, numericality: true
end