namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #Descriçao da tesk
  task setup: :environment do
    # %x executa comandos do terminal
    if Rails.env.development?
      show_spinner("Apagando BD...", "Apagado com sucesso!") { %x(rails db:drop)} 

      show_spinner("Criando BD...") { %x(rails db:create) } 

      show_spinner("Migrando BD...") { %x(rails db:migrate) }

      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)

    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas" #Descriçao da tesk
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas...") do
      coins = [ 
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"
        },
        {  
          description: "Ethereum",
          acronym: "BTC",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png"
        },
        {  
          description: "Dash",
          acronym: "DASH",
          url_image: "http://cryptowiki.net/images/5/55/Dash.png"
        },
        {  
          description: "Iota",
          acronym: "IOTA",
          url_image: "https://streamity.org/uploads/media/coin/0001/01/6d35a53a72515846128e19ea7a401df69b861fcc.svg"
        },
        {  
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://cdn4.iconfinder.com/data/icons/cryptocurrency-vanilla-coins/90/Coin-ZEC-Vanilla-512.png"
        }
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  desc "Cadastra os tipos de mineração" #Descriçao da tesk
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {name: "Proof of Work", acronym: "PoW"},
        {name: "Proof of Stake", acronym: "PoS"},
        {name: "Proof of Capacity", acronym: "PoC"}
      ]
        mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  #Refatorando a rake task
  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ")
    spinner.auto_spin 
    yield # bloco de código
    spinner.success("(#{msg_end})")
  end
end
