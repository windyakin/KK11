module Master
  class CircleBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :name_kana, :description
  end
end
