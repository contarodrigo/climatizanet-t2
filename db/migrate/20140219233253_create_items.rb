class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :qtdequipamento
      t.float :qtdtubulacao
      t.float :qtdextra
      t.string :tubulacao
      t.string :extra
      t.decimal :valor

      t.timestamps
    end
  end
end
