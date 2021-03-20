Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  
  root to: "homes#top"
  
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resource :cooked_records, only: [:create, :destroy]
    collection do 
      get "search"
    end
  end
  
  resources :articles do
    collection do 
      get "search"
    end
  end
  
end
