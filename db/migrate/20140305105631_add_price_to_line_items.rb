class AddPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2 # Total price for Products.
    patch_price
  end

  def patch_price
  	LineItem.all.each do |item| 
  	  item.price = item.product.price * item.quantity
  	  item.save!
  	end
  end
end
