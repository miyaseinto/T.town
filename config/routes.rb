Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :messages
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
