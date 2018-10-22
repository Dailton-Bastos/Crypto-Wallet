class WelcomeController < ApplicationController
  def index
    @nome_curso = params[:nome]#Variável de sessão
  end
end
