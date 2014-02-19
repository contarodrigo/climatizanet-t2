json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :data, :hora
  json.url agenda_url(agenda, format: :json)
end
