Chirp::Application.routes.draw do
  
  resources :pages
  root 'pages#home'

  match '/help',    to: 'pages#help',    via: :get
  match '/about',   to: 'pages#about',   via: :get
  match '/contact', to: 'pages#contact', via: :get
  match '/news',    to: 'pages#news',    via: :get

end