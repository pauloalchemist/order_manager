Rails.application.routes.draw do
  resources :suppliers
  resources :printpdf
  root to: 'pages#home'
  devise_for :users
end
