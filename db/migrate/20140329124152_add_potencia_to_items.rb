class AddPotenciaToItems < ActiveRecord::Migration
  def change
    add_column :items, :potencia, :string
  end
end
