Rails.application.routes.draw do
  resources :suppliers
  root to: 'pages#home'
  devise_for :users
end
