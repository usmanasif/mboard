Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :posts, except: [:edit, :destroy, :update] do
    resources :comments, only: [:create]
  end

  root to: 'posts#index'
end
