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
display_spinner("creating coins ...", "successfully created coins.") do
  coins.each do |coin|
    Coin.find_or_create_by!(coin)
  end
end


def display_spinner(message_start, message_end = "done!")
  spinner = TTY::Spinner.new("[:spinner] #{message_start}", format: :pulse_2)
  spinner.auto_spin

  yield

  spinner.success(message_end)
end