class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country, :presence => true

  scope :most_reviews, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :recently_added, -> {(
    select("products.*")
    .group("products.id")
    .order("created_at DESC")
    .limit(3)
  )}

  scope :highest_cost_first, -> {(
    select("products.*")
    .group("products.id")
    .order("cost DESC")
  )}
end
