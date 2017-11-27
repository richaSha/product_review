class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :content_body, :rating, :presence => true
  validates :rating, :inclusion => 1..5
  validates :content_body, length: {minimum: 50, maximum: 250}, allow_blank: true

end
