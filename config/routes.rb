Rails.application.routes.draw do
  # resources :expenditures
  resources :groups
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'groups/:post_id/expenditures', to: 'expenditures#index'
  get 'groups/:post_id/expenditures/new', to: 'expenditures#index'
  post 'groups/:post_id/expenditures/new', to: 'expenditures#create'
  post 'groups/:post_id/expenditures/:id', to: 'expenditures#show'
  delete '/expenditures/:id/delete', to: 'expenditures#delete'
  # Defines the root path route ("/")
  root 'groups#index'
end
