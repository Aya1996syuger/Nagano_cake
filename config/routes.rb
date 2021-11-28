Rails.application.routes.draw do

   
  devise_for :customers
  devise_for :admins,controllers: {sessions: 'admins/sessions' }

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'public/homes#top'
   get '/about' => 'public/homes#about'
   get '/admin' => 'admin/homes#top'

     namespace :public do
       resources :customers, only:[:show, :edit]
       resources :items, only: [:index, :show]
       resources :orders, only: [:index, :show]
       resources :cart_items, only: [:index ,:create]
     end

     namespace :admin do
       resources :homes
       resources :genres, only: [:index, :create, :edit, :update]
       resources :items
       resources :customers
     end
end
