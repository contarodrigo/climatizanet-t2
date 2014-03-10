class AddOrcamentoIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :orcamento, index: true
  end
end
