class GraficosChapasController < ApplicationController
  def index
    ###################################################### POR CHAPA
    @graficos_chapas = {}
    chapas = Chapa.all.each
    total = 0
    chapas.each do |chapa|
      total = RegistroDeVoto.sum('id', :conditions => ["chapa_id = ?", chapa.id])
      if total > 0
        @graficos_chapas[chapa.nome] = open_flash_chart_object(450,400, '/graficos/swf_por_chapa?idchapa=' + chapa.id.to_s, true)
      else
        @graficos_chapas[chapa.nome] = "Nenhum registro de voto para essa chapa"
      end
    end
  end
  
  def swf_por_chapa
    chapa = Chapa.find(params[:idchapa])

    barra_docentes = Bar.new(50, '#DD0000')
    barra_docentes.key('Docentes', 14)

    barra_tecnicos = Bar.new(50, '#00AA00')
    barra_tecnicos.key('Técnico ADM', 14)

    barra_alunos = Bar.new(50, '#0000AA')
    barra_alunos.key('Alunos', 14)

    y_maximo = 5000
    
    registros_de_voto = RegistroDeVoto.all(:conditions => ["chapa_id = ?", chapa.id])
    if registros_de_voto.empty?
      render :text => "Nenhum registro de voto para a chapa"
      return
    end
    total_votos_docentes = 0
    total_votos_tecnicos = 0
    total_votos_alunos = 0
    registros_de_voto.each do |registro|
      total_votos_docentes += registro.votos_docentes
      total_votos_tecnicos += registro.votos_tecnicoadm
      total_votos_alunos += registro.votos_alunos
    end
    #y_maximo = total_votos_docentes unless y_maximo > total_votos_docentes
    #y_maximo = total_votos_tecnicos unless y_maximo > total_votos_tecnicos
    #y_maximo = total_votos_alunos unless y_maximo > total_votos_alunos

    barra_docentes.data << total_votos_docentes
    barra_tecnicos.data << total_votos_tecnicos
    barra_alunos.data << total_votos_alunos

    g = Graph.new
    g.data_sets << barra_docentes
    g.data_sets << barra_tecnicos
    g.data_sets << barra_alunos

    g.set_x_labels([chapa.nome])
    g.title(chapa.nome, "{font-size: 26px;}")

    g.set_x_label_style(12, '#000', 0, 1)
    g.set_x_axis_steps(2)

    g.set_y_max(y_maximo + 20)
    g.set_y_label_steps(4)
    g.set_y_legend("Votos válidos", 16, "0x736AFF")

    render :text => g.render
  end
end
