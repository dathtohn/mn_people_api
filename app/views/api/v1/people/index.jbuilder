json.people @people do |person|
  json.id person.id
  json.name person.name
  json.date_of_birth person.date_of_birth
  json.deleted_at person.deleted_at
end
