json.array!(@mots) do |mot|
  json.extract! mot, :id, :mot_directeur, :francais, :espagnol
  json.url mot_url(mot, format: :json)
end
