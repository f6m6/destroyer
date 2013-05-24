Destroyer::Application.routes.draw do

  match "pages/*id" => "pages#show", format: false

  resources :pages, only: [:new, :create, :show]

  root to: 'pages#new'
  devise_for :users

  # match "*path" => redirect { |params| "pageso/#{params[:path]}" }
  
end
