Rails.application.routes.draw do
  devise_for :users
  authenticate :user do 
    resources :suppliers, only: [:index, :show, :new, :create]
    get 'dashboard', to: 'dashboards#dash'
  end

  root to: 'pages#home'
end
