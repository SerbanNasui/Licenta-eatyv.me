Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  get 'your_own_recipes', to: 'recipes#your_own_recipes'

  get 'cancel_reservation', to: 'reservations#cancel_reservation'

  get 'honored_reservation', to: 'reservations#honored_reservation'

  get 'your_reservations', to: 'reservations#your_reservations'

  resources :recipes do
    resources :reservations
    resources :reviews
  end
end
