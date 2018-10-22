module ApplicationHelper
  #Criando um helper para data e hora
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def nome_aplicacao
    "Crypto Wallet"
  end
  
end
