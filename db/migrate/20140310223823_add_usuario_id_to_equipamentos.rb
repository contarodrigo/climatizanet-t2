class AddUsuarioIdToEquipamentos < ActiveRecord::Migration
  def change
    add_reference :equipamentos, :usuario, index: true
  end
end
