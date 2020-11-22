module Master
  class BookBlueprint < Blueprinter::Base
    identifier :id

    fields :title, :published_at, :coalition, :explicit, :author_ids, :circle_ids

    view :show do
      fields :book_size, :tora_id, :melon_id, :booth_id
    end
  end
end
