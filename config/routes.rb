Rails.application.routes.draw do
   devise_for :customers
  devise_for :admins

  namespace :public do
    resources :items,only:[:index,:show,:create]
    resources :homes,only:[:index]
    resources :addresses,only:[:index,:create,:update,:edit,:destroy]
    resources :cart_items,only:[:show,:create,:update,:index,:destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as:'cart_items_destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/conprate' => 'orders#conprate'
    resources :orders
     patch '/customers/unsubscribe' => 'customers#unsubscribe',as:'customers_unsubscribe'
     delete '/customers/withdraw' => 'customers#destroy'
     get '/customers/mypage' => 'customers#show'
    resources :customers, :except => [:new,:index,:show]
    resources :order_details,only:[:create]
  end
  namespace :admin do
    get  'sign_in' => 'sessions#new'
    resources :items, only: [:create, :index, :show, :edit, :update, :destroy,:new]
    resources :genres, only: [:index, :create,:edit, :update]
    resources :customers, only: [:index,:create,:new, :update,:destroy,:show,:edit]
    resources :orders, only: [:show,:update,:new,:index]
    resources :order_details
  end
  root  'admin/items#top'
  get 'about' =>'admin/items#about'
end
