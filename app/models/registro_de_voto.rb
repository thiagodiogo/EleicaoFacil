class RegistroDeVoto < ActiveRecord::Base
  belongs_to :chapa
  belongs_to :local

  validates_associated     :chapa
  validates_associated     :local

  validates_presence_of     :votos_docentes, :votos_tecnicoadm, :votos_alunos
                            #:votos_alunos_brancos, :votos_alunos_nulos, :votos_alunos_abstinencia,
                            #:votos_docentes_brancos, :votos_docentes_nulos, :votos_docentes_abstinencia, 
                            #:votos_tecnicoadm_brancos, :votos_tecnicoadm_nulos, :votos_tecnicoadm_abstinencia
end
