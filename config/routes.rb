Depot::Application.routes.draw do
  get 'admin' => 'admin#index'
  get "store/index"

  root 'store#index', as: 'store' # as: 'store' creates store_path
  root to: 'store#index'

  resources :line_items
  resources :users
  resources :carts

  resources :orders do
    get :ship_order, on: :member # => /orders/id/ship_order
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :products do
  	get :who_bought, on: :member # product/:id/who_bought(.:format)
  end
end
