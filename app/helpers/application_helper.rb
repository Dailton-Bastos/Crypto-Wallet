module ApplicationHelper
  #Criando um helper para data e hora
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

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
