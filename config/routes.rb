Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users
end
