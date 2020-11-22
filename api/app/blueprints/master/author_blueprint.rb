module Master
  class AuthorBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :name_kana, :description, :twitter_id, :pixiv_id, :website_url
  end
end
