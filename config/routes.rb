Rails.application.routes.draw do
  root 'ripples#index', as: 'ripples_index'
  resources :ripples, only: [:index, :show, :create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
