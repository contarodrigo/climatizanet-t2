class AddTipoAgendaToAgendas < ActiveRecord::Migration
  def change
    add_column :agendas, :tipo_agenda, :string
  end
end
