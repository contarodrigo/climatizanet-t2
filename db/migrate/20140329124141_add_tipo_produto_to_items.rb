class AddTipoProdutoToItems < ActiveRecord::Migration
  def change
    add_column :items, :tipo_produto, :string
  end
end
