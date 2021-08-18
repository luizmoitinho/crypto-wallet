module WelcomeHelper

  #
  # Create a current date mask EN to PT-BR
  #
  # @return [Date] Current date with mask to PT_BR
  #
  def date_pt_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end

  def rails_env()
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"
    end
  end

  def get_language()
    I18n.locale == :en ? "Inglês" : 'Português (Brasil)'
  end

end
