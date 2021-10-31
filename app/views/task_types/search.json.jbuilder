json.array!(@tasktypes) do |tasktype|
  json.name tasktype.name 
  json.id tasktype.id
end