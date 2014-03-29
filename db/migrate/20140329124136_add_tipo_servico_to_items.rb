class AddTipoServicoToItems < ActiveRecord::Migration
  def change
    add_column :items, :tipo_Servico, :string
  end
end
