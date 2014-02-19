json.array!(@equipamentos) do |equipamento|
  json.extract! equipamento, :id, :descricao, :marca, :fornecedor, :potencia, :tipo, :modelo, :info
  json.url equipamento_url(equipamento, format: :json)
end
