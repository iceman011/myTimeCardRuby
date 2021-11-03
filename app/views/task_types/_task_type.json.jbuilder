
json.array!(@task_type) do |task_type|
  json.id task_type.id
  json.name task_type.name
end
