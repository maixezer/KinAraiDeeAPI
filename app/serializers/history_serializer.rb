class HistorySerializer < ActiveModel::Serializer
  attributes :id,
             :created_at,
             :updated_at

  has_one :user
  has_one :food
end
