Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to:'devices#index'

  resources :devices do
    collection do
      get 'list'
    end
  end

  resources :rentals do
    collection do
      post 'rental'
      get 'history'
    end
  end

  resources :returns do
  end
  
  resources :tasks do

    collection do
      get 'incomplete'
      get 'complete'
    end
    resources :comments, only: [:create, :destroy]
  end
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  post '/rentals/return/done' => 'rentals#done',   as: 'return_done'
end
