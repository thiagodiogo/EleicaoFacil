class RemoverCampoSecaoDeRegistroDeVotos < ActiveRecord::Migration
  def self.up
    remove_column :registro_de_votos, :secao
  end

  def self.down
    add_column :registro_de_votos, :secao, :integer
  end
end
