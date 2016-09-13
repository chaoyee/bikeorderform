Rails.application.routes.draw do
  resources :models
  resources :sizes
  resources :colors
  resources :orders do
    resources :orderdetails
  end
  get "/get_info", to: 'orderdetails#get_info', as: :get_info
  root 'orders#index'
  # post "/orders/:order_id/:model_id"  =>  'orderdetails#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
