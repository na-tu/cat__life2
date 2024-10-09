Rails.application.routes.draw do

    devise_for :users
  get '/home/about',to:'homes#about', as:'about'
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]#resource単数形にすると、/:idがURLに含まれない。
    resources :post_comments, only: [:create]
  end

  resources :users, only: [:show,:edit,:update,:index]
  resources :posts, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


  #devise_for :users
  #root to: 'homes#top'
  #get '/home/about',to:'homes#about', as:'about'
  #resources :users, only: [:show,:edit,:update,:index]

#end
