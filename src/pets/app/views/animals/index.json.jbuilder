json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :age, :type_of_animal, :description
  json.url animal_url(animal, format: :json)
end
