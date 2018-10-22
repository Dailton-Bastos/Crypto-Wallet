namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #Descriçao da tesk
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed) # %x executa comandos do terminal
  end

end
