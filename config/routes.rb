Rails.application.routes.draw do


  namespace :public do
  end
  resources 
  root to: "public/homes#top"
  get 'about' => "public/homes#about"

  namespace :admin do
    resources :genres,path: '/genres', only: [:index,:create,:edit,:update]
    resources :items, only: [:new,:index,:create,:show,:edit,:update]
    resources :customers, only: [:index, :show,:edit,:update]
    root to:  "homes#top"
    resources :orders , only: [:show, :update]
      resource :order_items, only:[:update]
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end