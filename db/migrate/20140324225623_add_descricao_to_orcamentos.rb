class AddDescricaoToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :descricao, :string
  end
end
