class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
  	page_counter
  	@products = Product.order(:title)
  end

  private
    def page_counter
      if session[:counter].nil? 
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end
end
