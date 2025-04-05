Rails.application.routes.draw do
  root "home#index"

  resources :despachos
  resources :armas
  resources :guardas
  resources :equipes
  resources :unidades
  devise_for :users
end
