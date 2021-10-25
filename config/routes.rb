Rails.application.routes.draw do
  devise_for :users
  authenticate :user do 
    resources :suppliers
  end

  root to: 'pages#home'
end
