class AddObservacaoToAgendas < ActiveRecord::Migration
  def change
    add_column :agendas, :observacao, :string
  end
end
