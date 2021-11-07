Rails.application.routes.draw do
  devise_for :users
  authenticate :user do 
    resources :suppliers
    get 'dashboard', to: 'dashboards#dash'
  end

  root to: 'pages#home'
end
