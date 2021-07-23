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

    display_spinner("running seeds ...") do
      %x(rails db:seed)
    end


    else
      puts "you are not using development enviroment"
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
