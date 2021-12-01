Rails.application.routes.draw do


    devise_for :customers
    devise_for :admins,controllers: {sessions: 'admins/sessions' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'
    get '/admin' => 'admin/homes#top'
    get '/unsubscribe/customer/:id' => 'customer#unsubscribe', as: 'confirm_unsubscribe'
    patch '/withdroaw/customer/:id' => 'customer#withdraw', as: 'withdraw_customer'

    namespace :public do
        resources :customers, only:[:show, :edit, :update, :withdraw, :unsubscribe]
        resources :items, only: [:index, :show]
        resources :orders, only: [:index, :show]
        resources :cart_items, only: [:index ,:update, :destroy, :create]
    end

    namespace :admin do
        resources :homes
        resources :genres, only: [:index, :create, :edit, :update]
        resources :items
        resources :customers
    end
end
