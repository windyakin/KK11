module User
  class ItemBlueprint < Blueprinter::Base
    identifier(:id) { |item| item.id.to_s }
    field(:master_type) { |item| item.master_type.demodulize }
    fields :master_id, :created_at, :updated_at
  end
end
