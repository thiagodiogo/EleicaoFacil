class CreateRegistroDeVotos < ActiveRecord::Migration
  def self.up
    create_table :registro_de_votos do |t|
      t.integer :secao
      t.integer :chapa_id
      t.integer :local_id
      t.integer :votos_docentes
      t.integer :votos_tecnicoadm
      t.integer :votos_alunos

      t.timestamps
    end
  end

  def self.down
    drop_table :registro_de_votos
  end
end
