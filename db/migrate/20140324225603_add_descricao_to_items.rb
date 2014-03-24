class AddDescricaoToItems < ActiveRecord::Migration
  def change
    add_column :items, :descricao, :string
  end
end
