class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country, :presence => true

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
end
