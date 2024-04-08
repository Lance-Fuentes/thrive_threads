# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all
Category.destroy_all
Role.destroy_all
User.destroy_all
UserRole.destroy_all
Order.destroy_all
AboutPageContent.destroy_all
ContactPageContent.destroy_all
AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

ContactPageContent.create(content: 'hello')
AboutPageContent.create(content: 'hellohello')

Category.create!([
  { name: 'Men' },
  { name: 'Women' },
  { name: 'Kids' },
  { name: 'Accessories' },
  { name: 'Home & Living' }
])

# Create products with images
#1
Product.create(
  name: "Know Your Worth Sweatshirt",
  price: 39.99,
  description: "Experience ultimate comfort with our unisex sweatshirt, perfect for any setting. Crafted from a cozy blend of 50% cotton and 50% polyester, this sweatshirt combines comfort with durability, making it ideal for the cooler months",
  category_id: Category.find_by(name: 'Women').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/1_women_worth.jpg'), filename: '1_women_worth.jpg', content_type: 'image/jpg')
end

#2
Product.create(
  name: "Ninja sweatshirt",
  price: 44.99,
  description: "This design draws inspiration from the rich cultural tapestry of Japan, blending the time-honored legacy of the ninja—masters of stealth and strategy—with the vibrant, pulsating energy of modern cyberpunk aesthetics. This design is a tribute to the enduring impact of Japanese culture on visual art and narrative, masterfully intertwining historical significance with a futuristic outlook.",
  category_id: Category.find_by(name: 'Women').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/2_women_ninja.jpg'), filename: '2_women_ninja.jpg', content_type: 'image/jpg')
end

#3
Product.create(
  name: "Love Tokyo t-shirt",
  price: 24.99,
  description: "Inspired by the vibrant streets, serene temples, and the unyielding spirit of the city, this collection is for the urban explorer at heart. Perfect for those who carry a piece of Tokyo in their souls, wherever they are.",
  category_id: Category.find_by(name: 'Men').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/3_men_tokyo.jpg'), filename: '3_men_tokyo.jpg', content_type: 'image/jpg')
end

#4
Product.create(
  name: "Educational Assistant Hooded Sweatshirt",
  price: 49.99,
  description: "As an Educational Assistant, I draw inspiration from my role. 'Education + Dedication = Transformation.' This equation signifies our shared mission in guiding students towards a brighter future.",
  category_id: Category.find_by(name: 'Men').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/4_men_ea.jpg'), filename: '4_men_ea.jpg', content_type: 'image/jpg')
end

#5
Product.create(
  name: "Stylish Panda Hoodie",
  price: 49.99,
  description: "The Explorer Panda Hoodie! Crafted for the bold and the fearless, this striking design is more than just apparel—it's an expression of your untamed spirit and zest for life. Perfect for urban explorers and nature enthusiasts alike, this hoodie is a call to embrace the journey, wherever it may lead. Join the Thrive movement and wear your wanderlust on your sleeve with the Explorer Panda Hoodie.",
  category_id: Category.find_by(name: 'Kids').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/5_kids_panda.jpg'), filename: '5_kids_panda.jpg', content_type: 'image/jpg')
end

#6
Product.create(
  name: "Meow Shirt",
  price: 44.99,
  description: "This classic unisex jersey short sleeve tee fits like a well-loved favorite. Soft cotton and quality print make users fall in love with it over and over again. These t-shirts have ribbed knit collars to bolster shaping. The shoulders are tapered for a better fit over time. Dual side seams hold the garment's shape for longer.",
  category_id: Category.find_by(name: 'Kids').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/6_kids_cat.jpg'), filename: '6_kids_cat.jpg', content_type: 'image/jpg')
end

#7
Product.create(
  name: "Personalized Charm Keychain,",
  price: 6.99,
  description: "Have you ever returned from a journey with just memories and no souvenirs? Worry not, our Customized Keychains are here to turn your travel photos into cherished keepsakes! ",
  category_id: Category.find_by(name: 'Accessories').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/7_acc_key.jpg'), filename: '7_acc_key.jpg', content_type: 'image/jpg')
end

#8
Product.create(
  name: "Personalized 20oz Stainless Steel Tumbler",
  price: 21.99,
  description: "Whether it's for yourself, a couple, your best friends, or anyone you hold dear, these tumblers make the perfect gift. Your design, my canvas, let's create something special together!

  Introducing the Thrive Threads Customized 20oz Tumbler - Your Personalized Drinkware Solution!",
  category_id: Category.find_by(name: 'Home & Living').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/8_hl_tumbler.jpg'), filename: '8_hl_tumbler.jpg', content_type: 'image/jpg')
end

#9
Product.create(
  name: "Accent Coffee Mug",
  price: 9.99,
  description: "Each sip from our Camping Mug is a toast to the wild—designed for those who carry the spirit of the campsite with them all year. Born from summer adventures and the companionship of my trusty mug, this design encapsulates the joy of camping in every season. Whether it's a reminder of starlit nights or a prelude to future escapades, this mug is for the campfire soul in all of us. Let's keep the essence of the outdoors by our side, through every season, one sip at a time",
  category_id: Category.find_by(name: 'Home & Living').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/9_hl_bless.jpg'), filename: '9_hl_bless.jpg', content_type: 'image/jpg')
end

#10
Product.create(
  name: "Two hearts one Mug",
  price: 9.99,
  description: "Dive into the essence of affection with our latest collection, where each stroke captures love's delicate flow and the strength of unity. Our designs, with their elegant swirls and a symphony of hearts, are crafted for those who carry romance in their soul and warmth in their actions. The singular heart amidst flowing lines is a homage to love’s journey, ideal for expressing your deepest sentiments. Embrace these creations from Thrive Threads and let the language of love dress your moments. Find your piece today and let your emotions unfold with style.",
  category_id: Category.find_by(name: 'Home & Living').id
).tap do |product|
  product.images.attach(io: File.open('storage/images/10_hl_heart2.jpg'), filename: '10_hl_heart2.jpg', content_type: 'image/jpg')
  product.images.attach(io: File.open('storage/images/10_hl_heart.jpg'), filename: '10_hl_heart.jpg', content_type: 'image/jpg')
end
