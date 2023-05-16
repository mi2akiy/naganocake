Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'adresses/index'
    get 'adresses/edit'
  end
   devise_for :customers,skip: [:passwords], controllers: {
     registrations: "public/registrations",
     sessions: 'public/sessions'
   }

   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
     sessions: "admin/sessions"
   }
  
   namespace :public do
    resource :customers, only:[:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdrawal'=> 'customers#withdrawal', as: 'withdrawal'
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :items, only: [:index, :show]
   end
   
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  root to: 'public/homes#top'
  get 'homes/about' => "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
