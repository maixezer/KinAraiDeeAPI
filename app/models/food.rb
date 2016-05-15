class Food < ApplicationRecord
  has_and_belongs_to_many :stores, join_table: 'foods_stores'

  has_many :histories
  has_many :users, through: :histories

  mount_uploader :image, FoodImageUploader

  validates :name,
            presence: true,
            uniqueness: true

  validates :calories, numericality: true

  def self.search(options)
    query = where(nil)
    query = query.where(calories: options[:min_calories]..options[:max_calories]) if options[:min_calories].present? && options[:max_calories].present?
    query = query.where("tags @> ARRAY[?]::text[]", options[:like_tags]) if options[:like_tags].present?
    query = query.where.not("tags @> ARRAY[?]::text[]", options[:dislike_tags]) if options[:dislike_tags].present?
    query
  end

  def tags_raw
    self.tags.join(',') unless self.tags.nil?
  end

  def tags_raw=(values)
    self.tags = []
    self.tags = values.split(',')
  end
end