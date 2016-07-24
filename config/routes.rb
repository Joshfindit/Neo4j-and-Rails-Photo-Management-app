Rails.application.routes.draw do
  resources :images
  resources :products
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
