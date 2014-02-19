class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.string :cep
      t.string :endereco
      t.string :bairro
      t.string :municipio
      t.string :estado
      t.string :telefone
      t.string :celular
      t.string :cpf
      t.string :rg
      t.text :info

      t.timestamps
    end
  end
end
