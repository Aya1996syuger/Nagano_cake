Rails.application.routes.draw do





    devise_for :customers,controllers: {sessions: 'public/sessions',registrations: 'public/registrations'}
    devise_for :admins,controllers: {sessions: 'admins/sessions' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/about' => 'public/homes#about'
    root to: 'public/homes#top'

    namespace :public do

        resources :customers, only:[:show, :edit, :update ]
         get '/unsubscribe/customers/:id' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
         patch '/withdroaw/customers/:id' => 'customers#withdraw', as: 'withdraw_customer'
        resources :items, only: [:index, :show]
        get '/orders/thanks' => 'orders#thanks', as: 'order_thanks'
        resources :orders, only: [:new, :index, :create, :show ]
        post '/orders/confirm' => 'orders#confirm', as: 'order_confirm'
        resources :cart_items, only: [:index ,:update, :destroy, :create, :update]
        delete '/cart_items' => 'cart_items#destroyall',as: 'destroy_all'
        resources :addresses, only: [:index, :create, :edit, :update, :destroy]
        get 'addresses/index'
        get 'addresses/edit'

    end

    namespace :admin do
        root to: 'homes#top'
        resources :homes
        resources :genres, only: [:index, :create, :edit, :update]
        resources :items
        resources :customers
        resources :order_details, only: [:show]
        get 'order_details/show'
    end
end
