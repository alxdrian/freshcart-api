Rails.application.routes.draw do
  devise_for :users, skip: %i[registrations sessions passwords]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :foods, only: [:index, :show]

  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
