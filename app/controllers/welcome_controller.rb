class WelcomeController < ApplicationController
  def index
    # instance/session variables start with @
    @name = "Luiz Moitinho"
    @course = "Ruby on Rails"
    if  params.key?('name') && params[:name] != ''
      @name = params[:name]
    end
    if  params.key?('course') && params[:course] != ''
      @course = params[:course]
    end


  end
end
