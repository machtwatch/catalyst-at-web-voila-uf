require 'json'

class UpsertCartsModel
  attr_accessor :price, :qty, :variant_id, :is_checked

  def as_json(options = {})
    {
      price: @price,
      qty: @qty,
      variant_id: @variant_id,
      is_checked: @is_checked
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
