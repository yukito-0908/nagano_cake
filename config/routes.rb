Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :public do
     resources :homes,only:[:index]
  end
  namespace :admin do
    get  'sign_in' => 'sessions#new'
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create,:edit, :update]
    root  'homes#top'
  end
   root 'public/homes#top'
end
