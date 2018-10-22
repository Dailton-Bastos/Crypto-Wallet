namespace :dev do
  desc "Configura o ambiente de desenvolvimento" #Descriçao da tesk
  task setup: :environment do
    # %x executa comandos do terminal
    if Rails.env.development?
      show_spinner("Apagando BD...", "Apagado com sucesso!") { %x(rails db:drop)} 

      show_spinner("Criando BD...") { %x(rails db:create) } 

      show_spinner("Migrando BD...") { %x(rails db:migrate) }

      show_spinner("Populando BD...") { %x(rails db:seed) } 

    else
      puts "Você não está em ambiente de desenvolvimento"
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
