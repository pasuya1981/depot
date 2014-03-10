# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer          default(1)
#  price      :decimal(8, 2)
#  order_id   :integer
#

# rails generate migration add_order_to_line_item order:references => order_id



class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
  	product.price * quantity
  end
end
