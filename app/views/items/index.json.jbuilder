json.array!(@items) do |item|
  json.extract! item, :id, :qtdequipamento, :qtdtubulacao, :qtdextra, :tubulacao, :extra, :valor
  json.url item_url(item, format: :json)
end
