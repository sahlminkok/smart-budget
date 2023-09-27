Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root "splash#index"
  end

  resources :groups, only: [:index, :new] do
    resources :expenses, only: [:index, :new]
  end
end
