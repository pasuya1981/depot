class RemovePayTypeIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :pay_type_id, :integer
  end
end
