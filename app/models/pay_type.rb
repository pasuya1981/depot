# == Schema Information
#
# Table name: pay_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PayType < ActiveRecord::Base

  def self.names
  	all.map(&:name)
  end

  def self.name_for_id(id)
    pay_methods[id]
  end

  def self.id_for_pay_type(method_name)
  	return nil unless self.pay_methods.include?(method_name) 
  	find_by_name(method_name).id
  end
end
