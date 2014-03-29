class AddUnidadeMedidaToItems < ActiveRecord::Migration
  def change
    add_column :items, :unidade_medida, :string
  end
end
