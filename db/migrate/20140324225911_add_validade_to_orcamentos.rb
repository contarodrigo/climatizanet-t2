class AddValidadeToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :validade, :date
  end
end
