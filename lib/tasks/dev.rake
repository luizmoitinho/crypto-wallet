namespace :dev do
  desc "development enviroment configuration"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

end
