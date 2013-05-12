Destroyer::Application.routes.draw do
  resources :pages, only: [:new, :create, :show]
  root to: 'pages#new'
  devise_for :users  
end
