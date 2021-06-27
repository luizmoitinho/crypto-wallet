class WelcomeController < ApplicationController
  def index
    # instance/session variables start with @
    @name = "Luiz Moitinho"
    @course = "Ruby on Rails"
  end
end
