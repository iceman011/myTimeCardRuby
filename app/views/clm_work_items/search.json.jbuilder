json.array!(@clm_work_items) do |clmworkitem|
  json.name clmworkitem.clm_title 
  json.id clmworkitem.id
end