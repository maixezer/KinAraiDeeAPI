class FoodsStores < ApplicationRecord
  belongs_to :store
  belongs_to :food
end