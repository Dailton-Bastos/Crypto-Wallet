module ApplicationHelper
  
  #Helper que verifica o idioma da aplicação
  def locale
    I18n.locale == :en ? "Estados Unidos" : "Português BR"
  end
  
  #Criando um helper para data e hora
=begin
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end
=end
  # Helper que retorna o nome da App
  def nome_aplicacao
    "Crypto Wallet"
  end
  
  #Helper que indentifica o ambiente Rails
  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"
    end
  end
end
