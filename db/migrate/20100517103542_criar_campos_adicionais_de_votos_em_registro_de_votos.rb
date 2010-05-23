class CriarCamposAdicionaisDeVotosEmRegistroDeVotos < ActiveRecord::Migration
  def self.up
    add_column :registro_de_votos, :votos_docentes_brancos, :integer
    add_column :registro_de_votos, :votos_docentes_nulos, :integer
    add_column :registro_de_votos, :votos_docentes_abstinencia, :integer
    
    add_column :registro_de_votos, :votos_tecnicoadm_brancos, :integer
    add_column :registro_de_votos, :votos_tecnicoadm_nulos, :integer
    add_column :registro_de_votos, :votos_tecnicoadm_abstinencia, :integer
    
    add_column :registro_de_votos, :votos_alunos_brancos, :integer
    add_column :registro_de_votos, :votos_alunos_nulos, :integer
    add_column :registro_de_votos, :votos_alunos_abstinencia, :integer
  end

  def self.down
    remove_column :registro_de_votos, :votos_docentes_brancos
    remove_column :registro_de_votos, :votos_docentes_nulos
    remove_column :registro_de_votos, :votos_docentes_abstinencia
    
    remove_column :registro_de_votos, :votos_tecnicoadm_brancos
    remove_column :registro_de_votos, :votos_tecnicoadm_nulos
    remove_column :registro_de_votos, :votos_tecnicoadm_abstinencia
    
    remove_column :registro_de_votos, :votos_alunos_brancos
    remove_column :registro_de_votos, :votos_alunos_nulos
    remove_column :registro_de_votos, :votos_alunos_abstinencia
  end
end
