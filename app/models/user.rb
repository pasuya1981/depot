# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains

  private

  def ensure_an_admin_remains
  	if User.count.zero?
  	  raise "Can't delete last user" # Cause database to rollback transaction
  	end
  end
end
