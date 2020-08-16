Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
  # root "posts#index"

  resources :posts do
    resources :comments, :only => [:create, :index, :new,  :edit, :update, :show, :destroy]
  end
  # post '/posts/:id/comments/create/', to: 'comments#create'
  # get '/posts/:id/comments', to: 'comments#index'
  # patch '/posts/:id/comments/:comment_id/edit', to: 'comments#update'

end
