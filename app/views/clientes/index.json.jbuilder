json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome, :email, :cep, :endereco, :bairro, :municipio, :estado, :telefone, :celular, :cpf, :rg, :info
  json.url cliente_url(cliente, format: :json)
end
