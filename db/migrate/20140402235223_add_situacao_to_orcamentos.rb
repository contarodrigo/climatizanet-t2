class AddSituacaoToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :situacao, :string
  end
end
