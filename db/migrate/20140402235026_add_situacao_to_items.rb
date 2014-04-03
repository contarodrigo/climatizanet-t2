class AddSituacaoToItems < ActiveRecord::Migration
  def change
    add_column :items, :situacao, :string
  end
end
