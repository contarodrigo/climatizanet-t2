class CreateEquipamentos < ActiveRecord::Migration
  def change
    create_table :equipamentos do |t|
      t.string :descricao
      t.string :marca
      t.string :fornecedor
      t.string :potencia
      t.string :tipo
      t.string :modelo
      t.text :info

      t.add_index :descricao unique: true
      t.add_index :potencia 

      t.timestamps
    end
  end
end
