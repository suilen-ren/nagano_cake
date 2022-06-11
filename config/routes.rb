Rails.application.routes.draw do


  root to: "public/homes#top"
  get 'about' => "public/homes#about"
  scope module: :public do
    resource :my_pages, path: "/my_page" ,only: [:show,:edit,:update] do
      get 'confirm'
      patch 'leave'
    end
    resources :addresses ,only: [:index, :edit,:create,:update ,:destroy]
  end

  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
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