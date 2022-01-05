Rails.application.routes.draw do
  devise_for :users
  
  root "pages#home"

  authenticate :user do 
    root 'dashboards#dash', as: :authenticated_root
    get '/dashboard' => "dashboards#dash", :as => :user_root
    resources :suppliers, only: [:index, :show, :new, :create]
  end


  # root to: 'pages#home'
end
