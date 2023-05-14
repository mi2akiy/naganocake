Rails.application.routes.draw do
   devise_for :customers,skip: [:passwords], controllers: {
     registrations: "public/registrations",
     sessions: 'public/sessions'
   }
  
   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
     sessions: "admin/sessions"
   }
 

  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :items, only: [:index, :show]
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  root to: 'public/homes#top'
  get 'homes/about' => "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
