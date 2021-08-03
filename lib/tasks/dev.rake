namespace :dev do
  desc "development enviroment configuration"
  task setup: :environment do
    if Rails.env.development?

    display_spinner("drop database ...") {
        %x(rails db:drop)
    }

    display_spinner("create database ...") {
        %x(rails db:create)
    }

    display_spinner("running migrates ...") do
      %x(rails db:migrate)
    end

    %x(rails dev:create_mining_types)

    %x(rails dev:create_coins)



    else
      puts "you are not using development enviroment"
    end
  end


  desc "create coins"
  task create_coins: :environment do
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
        mining_type: MiningType.find_by(acronym: 'PoW') #  mining_type: MiningType.where(acronym: 'PoW').first
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/dash-dash-logo.png",
        mining_type: MiningType.all.sample
       },
      {
        description: "Iota",
        acronym: "IOT",
        url_image: "https://www.iconpacks.net/icons/2/free-iota-coin-icon-2220-thumb.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "ZCash",
        acronym: "ZEC",
        url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Zcash-ZEC-icon.png",
        mining_type: MiningType.all.sample
      },
    ]

    puts "creating coins..."
    display_spinner("creating coins ...", "successfully created coins.") do
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "create mining types"
  task create_mining_types: :environment do
    mining_types = [
      {description: "Proof Of Work", acronym: "PoW"},
      {description: "Proof Of Stake", acronym: "PoS"},
      {description: "Proof Of Capacity", acronym: "PoC"},
    ]

    puts "creating mining types..."
    display_spinner("creating mining types ...", "successfully created mining types.") do
      mining_types.each do | mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
    def display_spinner(message_start, message_end = "done!")
      spinner = TTY::Spinner.new("[:spinner] #{message_start}", format: :pulse_2)
      spinner.auto_spin

      yield

      spinner.success(message_end)
    end

end
