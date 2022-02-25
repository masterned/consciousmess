Rails.application.routes.draw do
  root 'ripples#index', as: 'ripples_index'
  resources :ripples, only: [:index, :show, :create, :new]

  get '/newest', to: 'ripples#newest', as: 'newest'
  get '/previous_10', to: 'ripples#previous_10', as: 'previous_10'
  get '/next_10', to: 'ripples#next_10', as: 'next_10'
  get '/oldest', to: 'ripples#oldest', as: 'oldest'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
