Myrottenpotatoes::Application.routes.draw do
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')

  get  'auth/:provider/callback' => 'sessions#create'
  get  'auth/:provider' => 'sessions#loginbefore'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/twitter', :as => 'login'
  post 'logout' => 'sessions#destroy'
end
