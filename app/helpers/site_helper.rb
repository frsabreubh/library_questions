module SiteHelper
  def msg_jumbotron
    case params[:action]
      when 'index'
        "Últimas Questões Cadastradas..."
      when 'questions'
        "Resultado da Pesquisa por \"#{params[:term]}\"..."
      when 'subject'
      "Questões selecionadas por Assunto/Área: \"#{params[:subject]}\"..."
    end
  end
end
