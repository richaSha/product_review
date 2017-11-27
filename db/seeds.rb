Review.destroy_all
Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Name.name,
                  cost: Faker::Number.between(1, 20),
                  country: Faker::Space.planet)
end

p "Created #{Product.count} productss"
