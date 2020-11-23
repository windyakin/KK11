module Master
  class CircleBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :name_kana

    view :show do
      fields :description
    end
  end
end
