class WelcomeController < ApplicationController
  def index
    #cookies e sessions
    cookies[:curso] = "Curso de Ruby on Rails [COOKIE]"
    session[:curso] = "Curso de Ruby on Rails [SESSION]"
    @nome_curso = params[:nome]#Variável de sessão
    @curso = params[:curso]
  end
end
