json.id           book.id
json.title        book.title
json.published_at book.published_at
json.coalition    book.coalition
json.explicit     book.explicit
json.book_size    book.book_size
json.tora_id      book.tora_id
json.melon_id     book.melon_id
json.booth_id     book.booth_id

json.authors do
  json.array! book.authors, partial: 'master/author_simple', as: :author
end

json.circles do
  json.array! book.circles, partial: 'master/circle_simple', as: :circle
end
