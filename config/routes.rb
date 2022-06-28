Rails.application.routes.draw do
  # resources :expenditures
  resources :groups
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'groups/:group_id/expenditures', to: 'expenditures#index'
  get 'groups/:group_id/expenditures/new', to: 'expenditures#new'
  get 'groups/:group_id/expenditures/:id/edit', to: 'expenditures#edit'
  post 'groups/:group_id/expenditures/create', to: 'expenditures#create'
  get 'groups/:group_id/expenditures/:id', to: 'expenditures#show'
  delete '/groups/:group_id/expenditures/:id/delete', to: 'expenditures#delete'
  # Defines the root path route ("/")
  root 'groups#index'
end
