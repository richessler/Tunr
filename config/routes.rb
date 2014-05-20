Rails.application.routes.draw do
  root 'welcome#index'

  resources :artists do
    resources :songs, except: [:index, :show], shallow: true
  end
  
  get '/search' => 'songs#search'

  resources :users
  resources :sessions, only: [:create]

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

end
