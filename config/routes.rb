Rails.application.routes.draw do
  root 'ripples#index', as: 'ripples_index'
  resources :ripples
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
