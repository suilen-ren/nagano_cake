Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]

    resources :items, only: [:new,:index,:create,:show,:edit,:update]
  end
  devise_for :admin,conrollers: {
    sessions: "admin/sessions",
    passwords: "admin/passwords",
    registrations: "admin/registrations"
  }
  devise_for :customer
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
