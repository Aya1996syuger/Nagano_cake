Rails.application.routes.draw do


  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
    devise_for :customers
    devise_for :admins,controllers: {sessions: 'admins/sessions' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'
    get '/admin' => 'admin/homes#top'


    namespace :public do
        resources :customers, only:[:show, :edit, :update ]
         get '/unsubscribe/customers/:id' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
         patch '/withdroaw/customers/:id' => 'customers#withdraw', as: 'withdraw_customer'
        resources :items, only: [:index, :show]
        resources :orders, only: [:new, :index ]
        patch '/orders' => 'orders#create' , as: 'order_create'
        post '/orders/confirm' => 'orders#confirm', as: 'order_confirm'
        get '/orders/thanks' => 'orders#thanks', as: 'order_thanks'
        resources :cart_items, only: [:index ,:update, :destroy, :create, :update]
        delete '/cart_items' => 'cart_items#destroyall',as: 'destroy_all'
        resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    end

    namespace :admin do
        resources :homes
        resources :genres, only: [:index, :create, :edit, :update]
        resources :items
        resources :customers
    end
end
