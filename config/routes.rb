Rails.application.routes.draw do
  devise_for :users
  authenticate :user do 
    resources :suppliers, only: [:index, :show, :new, :create]
    # get 'dashboard', to: 'dashboards#dash'
    get '/user' => "dashboards#dash", :as => :user_root
  end


  root to: 'pages#home'
end
