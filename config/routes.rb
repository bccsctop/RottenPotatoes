Myrottenpotatoes::Application.routes.draw do
  #movie
  resources :movies do
    resources :reviews
  end
  #root
  root :to => redirect('/movies')

  #Session
  get  'auth/:provider/callback' => 'sessions#create'
  get  'auth/:provider' => 'sessions#loginbefore'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/twitter', :as => 'login'
  post 'logout' => 'sessions#destroy'

  #TMDB
  post '/movies/show_tmdb' => 'movies#search_tmdb'

end
