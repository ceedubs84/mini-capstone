Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/one_product_url' => 'products#one_product_method'
  get '/all_product_url' => 'products#all_product_method'
end
