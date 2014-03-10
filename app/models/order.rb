# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  pay_type   :string(255)
#  ship_date  :datetime
#

class Order < ActiveRecord::Base

  validates :name, :email, :address, presence: true
  validates :pay_type, inclusion: PayType.names

  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil # prevent item from disappearing after cart been destoyred.
      line_items << item # Rails will do the association.
    end
  end
end
