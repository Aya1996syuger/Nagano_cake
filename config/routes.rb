Rails.application.routes.draw do
    devise_for :admins,controllers: {
    registrations: 'admins/registrations'
  }

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'public/homes#top'
   get '/about' => 'public/homes#about'
   get '/admin' => 'admin/homes#top'


   namespace :admin do
     resources :homes
     resources :genres,onle:[:index, :create, :edit, :update]
     resources :items
     resources :customers

   end
end
