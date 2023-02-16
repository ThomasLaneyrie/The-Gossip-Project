Rails.application.routes.draw do
  # Pages statiques
  get '/home', to: 'static_pages#home'
  get '/team', to: 'static_pages#team'  
  get '/contact', to: 'static_pages#contact'
  
  # Pour la gestion des connexions :
  resources :sessions, only: [:new, :create, :destroy]

  # REST & CRUD : 7 routes crées avec le resources
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :authors,  only: [:new, :create, :index, :show] 
  resources :cities, only: [:show] 

end
