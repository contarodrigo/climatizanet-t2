class AddClienteIdToAgendas < ActiveRecord::Migration
  def change
    add_reference :agendas, :cliente, index: true
  end
end
