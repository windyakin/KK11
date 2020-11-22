module Master
  class BookBlueprint < Blueprinter::Base
    identifier :id
    fields :title, :published_at, :coalition, :explicit, :book_size, :tora_id, :melon_id, :booth_id, :author_ids, :circle_ids
  end
end
