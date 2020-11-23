Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to:'devices#index'

  resources :devices do
    collection do
      get 'list'
    end
  end
  
  resources :tasks do
  end
  
end
