# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## USERS

puts "Re-creating Users..."

User.destroy_all

spooky = User.create!({
  first_name:  'Spooky',
  last_name: 'Skeleton',
  email: '111@email.ca',
  password_digest: BCrypt::Password.create('111')
})

spoopy = User.create!({
  first_name:  'Spoopy',
  last_name: 'Ghost',
  email: '000@email.ca',
  password_digest: BCrypt::Password.create('000')
})

diablo = User.create!({
  first_name:  'Diablo',
  last_name: 'Demon',
  email: '666@email.ca',
  password_digest: BCrypt::Password.create('666')
})

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

men_classy_shirt = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

women_zebra_pants = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

hipster_hat = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

hipster_socks = cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

russian_spy_shoes = cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 0,
  price: 1_225.00
})

human_feet_shoes = cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


modern_skateboard = cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

hotdog_slicer = cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

worlds_largest_smartwatch = cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

optimal_sleeping_bed = cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

electric_chair = cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

red_bookshelf = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

## REVIEWS

puts "Re-creating Reviews..."

Review.destroy_all 

review_osb = Review.create!({
  product_id: optimal_sleeping_bed.id,
  user_id: spooky.id,
  description: 'Perfect fit, very happy with pruchase adn highly reccomend to other rickety boned people',
  rating: 5
})

review_ms = Review.create!({
  product_id: modern_skateboard.id,
  user_id: spoopy.id,
  description: 'Able to get around very fast to be extra spoopy this coming spoopy season!',
  rating: 5
})

review_mcs = Review.create!({
  product_id: men_classy_shirt.id,
  user_id: diablo.id,
  description: 'Quality okay...not the best fit around torso. Need to find another shirt for upcoming job interview though...',
  rating: 2
})

puts "DONE!"
