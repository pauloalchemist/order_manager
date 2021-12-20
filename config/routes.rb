Rails.application.routes.draw do
  devise_for :users
  
  unauthenticated do
    root "pages#home"
  end

  authenticate :user do 
    root 'dashboards#dash', as: :authenticated_root
    get '/dashboard' => "dashboards#dash", :as => :user_root
    resources :suppliers, only: [:index, :show, :new, :create]
  end


  # root to: 'pages#home'
end
