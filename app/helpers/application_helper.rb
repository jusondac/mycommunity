module ApplicationHelper
  include Pagy::Frontend

  def to_price(price)
    # "$#{price.to_i}."+"#{(price % 1.0)}"[2..3]
    "$"+number_with_delimiter(price)
  end
end
