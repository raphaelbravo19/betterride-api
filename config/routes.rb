Rails.application.routes.draw do
  resources :counting_items
  resources :lanes_counts
  resources :sessions
  resources :avenues
  resources :junctions
  resources :projects
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
