# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


coins = [
  { description: "Bitcoin", acronym: "BTC", url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png" },
  { description: "Ethereum", acronym: "ETH", url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo.png" },
  { description: "Dash", acronym: "DASH", url_image: "https://cryptologos.cc/logos/dash-dash-logo.png" },
]

puts "creating coins..."

coins.each do |coin|
  Coin.create!(coin)
end

puts "successfully created coins."

