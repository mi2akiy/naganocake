Rails.application.routes.draw do

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
    resources :cart_items, only: [:index, :update, :destroy, :create] do
        collection do
          delete "destroy_all"
      end
  end
    resources :items, only: [:index, :show]
    resources :orders, only:[:new, :index, :show]
    get 'orders/complete'
    resources :adresses, only:[:index, :create, :edit, :update, :destroy]
   end

  namespace :admin do
    get 'homes/top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'orders/show'
  end

  root to: 'public/homes#top'
  get 'homes/about' => "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
