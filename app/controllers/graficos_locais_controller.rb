class GraficosLocaisController < ApplicationController
  def index
    ####################################################### POR LOCAL
    @graficos_locais = {}
    locais = Local.find(:all, :order => "nome ASC")
    locais.each do |local|
      puts "PROCESSANDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO:#{local.nome}"
      chapas = Chapa.all
      total = 0
      chapas.each do |chapa|
        total = RegistroDeVoto.sum('id', :conditions => ["local_id = ? and chapa_id = ?", local.id, chapa.id])
      end
      if total > 0
        @graficos_locais[local.nome_completo] = open_flash_chart_object(800,400, '/graficos/swf_por_local?idlocal=' + local.id.to_s, true)
      else
        @graficos_locais[local.nome_completo] = "Nenhum registro de para esse local"
      end
    end
  end


  def swf_por_local
    local = Local.find(params[:idlocal])

    barra_docentes = Bar.new(50, '#DD0000')
    barra_docentes.key('Docentes', 20)

    barra_tecnicos = Bar.new(50, '#00AA00')
    barra_tecnicos.key('Técnico ADM', 20)

    barra_alunos = Bar.new(50, '#0000AA')
    barra_alunos.key('Alunos', 20)

    chapas = Chapa.all

    y_maximo = 0
    chapas.each do |chapa|
      registros_de_voto = RegistroDeVoto.all(:conditions => ["local_id = ? and chapa_id = ?", local.id, chapa.id])
      total_votos_docentes = 0
      total_votos_tecnicos = 0
      total_votos_alunos = 0
      registros_de_voto.each do |registro|
        total_votos_docentes += registro.votos_docentes
        total_votos_tecnicos += registro.votos_tecnicoadm
        total_votos_alunos += registro.votos_alunos
      end
      y_maximo = total_votos_docentes unless y_maximo > total_votos_docentes
      y_maximo = total_votos_tecnicos unless y_maximo > total_votos_tecnicos
      y_maximo = total_votos_alunos unless y_maximo > total_votos_alunos

      barra_docentes.data << total_votos_docentes
      barra_tecnicos.data << total_votos_tecnicos
      barra_alunos.data << total_votos_alunos
    end

    g = Graph.new
    g.data_sets << barra_docentes
    g.data_sets << barra_tecnicos
    g.data_sets << barra_alunos

    g.set_x_labels(chapas.map {|c| c.nome})
    g.title(local.nome_completo, "{font-size: 26px;}")

    g.set_x_label_style(12, '#000', 0, 1)
    g.set_x_axis_steps(2)

    g.set_y_max(y_maximo + 20)
    g.set_y_label_steps(4)
    g.set_y_legend("Votos válidos", 20, "0x736AFF")

    render :text => g.render
  end  
end
