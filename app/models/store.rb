class Store < ApplicationRecord
  has_and_belongs_to_many :foods, join_table: 'foods_stores'

  validates :name,
            presence: true,
            length: {in: 3..50}

  validates :lat, :lng,
            presence: true
end
