namespace :dev do
  desc "development enviroment configuration"
  task setup: :environment do
    if Rails.env.development?

      spinner = TTY::Spinner.new("[:spinner] drop database ...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success("done!")

      spinner = TTY::Spinner.new("[:spinner] create database ...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:create )
      spinner.success("done!")

      spinner = TTY::Spinner.new("[:spinner] running migrates ...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("done!")

      spinner = TTY::Spinner.new("[:spinner] running seeds ...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success("done!")

    else
      puts "you are not using development enviroment"
    end
  end
end
