class ApplicationController < ActionController::Base
  before_action :switch_locale

  def switch_locale(&action)
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale] && I18n.locale != cookies[:locale]
      I18n.locale = cookies[:locale]
    end
  end
end
