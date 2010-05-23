class CriarCamposSecaoEMesaEmLocal < ActiveRecord::Migration
  def self.up
    add_column :locals, :secao, :integer
    add_column :locals, :mesa, :integer
  end

  def self.down
    remove_column :locals, :secao
    remove_column :locals, :mesa
  end
end
