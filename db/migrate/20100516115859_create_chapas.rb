class CreateChapas < ActiveRecord::Migration
  def self.up
    create_table :chapas do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :chapas
  end
end
