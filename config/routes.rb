Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users

  resources :groups, only: [:index, :new]
end
