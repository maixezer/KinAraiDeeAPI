class FoodSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :tags,
             :calories,
             :image,
             :created_at,
             :updated_at

  has_many :stores

  def image
    object.image.medium.url
  end
end
