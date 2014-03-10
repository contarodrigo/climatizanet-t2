class AddClienteIdToOrcamentos < ActiveRecord::Migration
  def change
    add_reference :orcamentos, :cliente, index: true
  end
end
