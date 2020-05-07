json.id      item.id
json.type    item.master_type.demodulize
json.master do
  json.partial! 'master/book', book: item.master
end
