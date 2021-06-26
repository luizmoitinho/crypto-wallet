module WelcomeHelper

  #
  # Create a current date mask EN to PT-BR
  #
  # @return [Date] Current date with mask to PT_BR
  #
  def date_pt_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end
end
