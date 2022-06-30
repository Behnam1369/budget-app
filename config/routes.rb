Rails.application.routes.draw do
  resources :groups, only: %i[index new create]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'groups/:group_id/expenditures', to: 'expenditures#index'
  get 'groups/:group_id/expenditures/new', to: 'expenditures#new'
  post 'groups/:group_id/expenditures/create', to: 'expenditures#create'

  authenticated do
    root to: 'groups#index', as: 'user'
  end

  unauthenticated do
    root to: 'users#index', as: 'unauthenticated_user_root'
  end
end
