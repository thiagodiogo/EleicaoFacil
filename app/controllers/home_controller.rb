class HomeController < ApplicationController
  def index
    ###################################################### GERAL
    @graficos_gerais = {}
    total = RegistroDeVoto.sum('id')
    if total > 0
      @graficos_gerais["Somatório Geral"] = open_flash_chart_object(600,400, '/graficos/geral', true)
    else
      @graficos_gerais["Somatório Geral"] = "Nenhum registro de voto"
    end

    @total_validos = RegistroDeVoto.sum('votos_alunos + votos_tecnicoadm + votos_docentes')
    @total_brancos = RegistroDeVoto.sum('votos_alunos_brancos + votos_tecnicoadm_brancos + votos_docentes_brancos')
    @total_nulos = RegistroDeVoto.sum('votos_alunos_nulos + votos_tecnicoadm_nulos + votos_docentes_nulos')
    @total_abstencoes = RegistroDeVoto.sum('votos_alunos_abstinencia + votos_tecnicoadm_abstinencia + votos_docentes_abstinencia')

    @votos_apurados = @total_validos.to_i + @total_abstencoes.to_i + @total_nulos.to_i + @total_brancos.to_i
    @total_votos_possiveis = 2781 + 3886 + 29310

    @total_urnas = Local.count
    @total_urnas_apuradas = RegistroDeVoto.count(:local_id, :distinct => "true")

    @grafico_urnas_apuradas = open_flash_chart_object(250,250, '/graficos/urnas_apuradas', true)
  end

  def urnas_apuradas
    dados = []
    status_urna = []
    total_geral = 0

    status_urna << 'Apurada'
    status_urna << 'Não Apurada'

    total_urnas = Local.count
    total_urnas_apuradas = RegistroDeVoto.count(:local_id, :distinct => "true")

    dados << total_urnas_apuradas
    dados << total_urnas - total_urnas_apuradas

    g = Graph.new
    g.pie(90, '#505050', '{font-size: 12px; color: #404040;}')
    g.pie_values(dados, status_urna)
    g.pie_slice_colors(%w(#00DD00 #0000DD))
    #    g.set_tool_tip("#val#%")
    g.set_tool_tip("'#x_label# [#val# urnas]'")
    g.title("Urnas", '{font-size:18px; color: #d01f3c;}' )
    render :text => g.render
  end

  def geral
    chapas = Chapa.all
    dados = []
    nomes_chapas = []
    total_geral = 0

    chapas.each do |chapa|
      total_pontos_da_chapa = RegistroDeVoto.sum('(votos_docentes/2781) + (votos_tecnicoadm/3886) + (votos_alunos/29310)', 
      :conditions => ["chapa_id = ?", chapa.id])
      nomes_chapas << chapa.nome
      dados << total_pontos_da_chapa
      total_geral += total_pontos_da_chapa.to_f
      #      puts "total_votos_da_chapa:#{chapa.nome} = #{total_votos_da_chapa}"
    end

    if total_geral > 0
      #      <%=h ("%.2f" % @total_horas_da_semana) %>h
      dados = dados.map {|valor| ("%.2f" % ((valor.to_f/total_geral)*100))}
    end

    g = Graph.new
    g.pie(90, '#505050', '{font-size: 12px; color: #404040;}')
    g.pie_values(dados, nomes_chapas)
    g.pie_slice_colors(%w(#FF0000 #0000FF))
    #    g.set_tool_tip("#val#%")
    g.set_tool_tip("'#x_label# [#val# pontos]'")
    g.title("Total de pontos - Resultado parcial da eleição", '{font-size:18px; color: #d01f3c;}' )
    render :text => g.render
  end

end
