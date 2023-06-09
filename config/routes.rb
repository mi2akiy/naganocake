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
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    resources :adresses, only:[:index, :create, :edit, :update, :destroy]
   end

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show]
  end

  root to: 'public/homes#top'
  get 'homes/about' => "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
