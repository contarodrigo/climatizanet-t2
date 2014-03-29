class AddProdutoToItems < ActiveRecord::Migration
  def change
    add_column :items, :produto, :string
  end
end
