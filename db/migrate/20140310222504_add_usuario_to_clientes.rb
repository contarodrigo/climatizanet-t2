class AddUsuarioToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :usuario, index: true
  end
end
