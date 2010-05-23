class GraficosCategoriasController < ApplicationController
  def index
    ####################################################### POR CATEGORIA
    @graficos_categorias = {}

    @graficos_categorias['Docentes'] = open_flash_chart_object(240,400, '/graficos/swf_por_categoria?idcategoria=docentes', true)
    @graficos_categorias['Alunos'] = open_flash_chart_object(240,400, '/graficos/swf_por_categoria?idcategoria=alunos', true)
    @graficos_categorias['Técnicos ADM'] = open_flash_chart_object(240,400, '/graficos/swf_por_categoria?idcategoria=tecnicos', true)

    @total_brancos_alunos = RegistroDeVoto.sum('votos_alunos_brancos + votos_tecnicoadm_brancos + votos_docentes_brancos')
    @total_nulos_alunos = RegistroDeVoto.sum('votos_alunos_nulos + votos_tecnicoadm_nulos + votos_docentes_nulos')
    @total_abstencoes_alunos = RegistroDeVoto.sum('votos_alunos_abstinencia + votos_tecnicoadm_abstinencia + votos_docentes_abstinencia')
    
    @total_brancos_tecnicos = RegistroDeVoto.sum('votos_tecnicoadm_brancos + votos_tecnicoadm_brancos + votos_tecnicoadm_brancos')
    @total_nulos_tecnicos = RegistroDeVoto.sum('votos_tecnicoadm_nulos + votos_tecnicoadm_nulos + votos_tecnicoadm_nulos')
    @total_abstencoes_tecnicos = RegistroDeVoto.sum('votos_tecnicoadm_abstinencia + votos_tecnicoadm_abstinencia + votos_tecnicoadm_abstinencia')
    
    @total_brancos_docentes = RegistroDeVoto.sum('votos_docentes_brancos + votos_docentes_brancos + votos_docentes_brancos')
    @total_nulos_docentes = RegistroDeVoto.sum('votos_docentes_nulos + votos_docentes_nulos + votos_docentes_nulos')
    @total_abstencoes_docentes = RegistroDeVoto.sum('votos_docentes_abstinencia + votos_docentes_abstinencia + votos_docentes_abstinencia')
  end


  def swf_por_categoria

    barra_validos = Bar.new(80, '#000000')
    
    if(params['idcategoria'] == 'docentes')
      barra_validos = Bar.new(70, '#DD0000')
    else
      if (params['idcategoria'] == 'alunos')
        barra_validos = Bar.new(60, '#0000AA')
      else
        if (params['idcategoria'] == 'tecnicos')
          barra_validos = Bar.new(60, '#00AA00')
        end
      end
    end
    
    barra_validos.key('Votos válidos', 14)

    chapas = Chapa.all

    y_maximo = 0
    chapas.each do |chapa|
      registros_de_voto = RegistroDeVoto.all(:conditions => ["chapa_id = ?", chapa.id])
      total_votos_docentes_validos = 0
      total_votos_docentes_brancos = 0
      total_votos_docentes_nulos = 0
      total_votos_docentes_abstinencias = 0
      
      total_votos_alunos_validos = 0
      total_votos_alunos_brancos = 0
      total_votos_alunos_nulos = 0
      total_votos_alunos_abstinencias = 0
      
      total_votos_tecnicos_validos = 0
      total_votos_tecnicos_brancos = 0
      total_votos_tecnicos_nulos = 0
      total_votos_tecnicos_abstinencias = 0
      
      registros_de_voto.each do |registro|
        if(params['idcategoria'] == 'docentes')
          total_votos_docentes_validos      += registro.votos_docentes
        else
          if (params['idcategoria'] == 'alunos')
            total_votos_alunos_validos      += registro.votos_alunos
          else
            if (params['idcategoria'] == 'tecnicos')
              total_votos_tecnicos_validos      += registro.votos_tecnicoadm
            end
          end
        end
      end
      
      if(params['idcategoria'] == 'docentes')
        y_maximo = total_votos_docentes_validos unless y_maximo > total_votos_docentes_validos
        y_maximo = total_votos_docentes_brancos unless y_maximo > total_votos_docentes_brancos
        y_maximo = total_votos_docentes_nulos unless y_maximo > total_votos_docentes_nulos
        y_maximo = total_votos_docentes_abstinencias unless y_maximo > total_votos_docentes_abstinencias
        barra_validos.data << total_votos_docentes_validos
      else
        if (params['idcategoria'] == 'alunos')
          y_maximo = total_votos_alunos_validos unless y_maximo > total_votos_alunos_validos
          y_maximo = total_votos_alunos_brancos unless y_maximo > total_votos_alunos_brancos
          y_maximo = total_votos_alunos_nulos unless y_maximo > total_votos_alunos_nulos
          y_maximo = total_votos_alunos_abstinencias unless y_maximo > total_votos_alunos_abstinencias
          barra_validos.data << total_votos_alunos_validos
        else
          if (params['idcategoria'] == 'tecnicos')
            y_maximo = total_votos_tecnicos_validos unless y_maximo > total_votos_tecnicos_validos
            y_maximo = total_votos_tecnicos_brancos unless y_maximo > total_votos_tecnicos_brancos
            y_maximo = total_votos_tecnicos_nulos unless y_maximo > total_votos_tecnicos_nulos
            y_maximo = total_votos_tecnicos_abstinencias unless y_maximo > total_votos_tecnicos_abstinencias
            barra_validos.data << total_votos_tecnicos_validos
          end
        end
      end
    end

    g = Graph.new
    g.data_sets << barra_validos

    g.set_x_labels(chapas.map {|c| c.nome})
    
    if (params['idcategoria'] == 'tecnicos')
      g.title("Técnicos ADM", "{font-size: 26px;}")
    else
      if(params['idcategoria'] == 'docentes')
        g.title("Docentes", "{font-size: 26px;}")
      else
        g.title("Alunos", "{font-size: 26px;}")
      end
    end

    g.set_x_label_style(10, '#000', 2, 1)
    g.set_x_axis_steps(2)

    g.set_y_max(y_maximo + 100)
    g.set_y_label_steps(4)
    g.set_y_legend("Votos", 14, "0x736AFF")

    render :text => g.render
  end
end
