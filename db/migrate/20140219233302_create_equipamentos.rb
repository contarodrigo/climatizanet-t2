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

      t.timestamps
    end
  end
end
