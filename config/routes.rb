Rails.application.routes.draw do
  get 'comment/index'
  get 'comment/create'
  get 'comment/new'
  # get '/home', to: 'static_pages#home'  
  # get '/gossips/:id', to: 'gossips#show', as: 'show'
  # get '/author/:id', to: 'author#show', as: 'author'


  # Pages statiques
  get '/team', to: 'static_pages#team'  
  get '/contact',to: 'static_pages#contact'  

  # Autres pages un peu solo à changer plus tard
  get '/welcome/:first_name', to: 'welcome#first_name'

  # REST & CRUD : 7 routes crées avec le resources
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :authors,  only: [:index, :show] 
  resources :cities, only: [:show] 
end
