class Local < ActiveRecord::Base
  has_many :registro_de_voto
  
  def nome_completo
    "#{nome} - Seção: #{secao} - Mesa: #{mesa}"
  end
end
