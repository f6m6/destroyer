Destroyer::Application.routes.draw do
  # wanted to keep it resourceful but couldn't get this to work

  #constraints :format => // do
  #  resources :pages, only: [:new, :create, :show]
  #end

  match "pages/*id" => "pages#show", :format => false

  resources :pages, only: [:new, :create, :show]

  root to: 'pages#new'
  devise_for :users  
end
