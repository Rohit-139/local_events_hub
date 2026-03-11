Rails.application.routes.draw do

  devise_for :users , controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
}

namespace :admin do 
  resources :events
end

namespace :user do 
  resources :events, only: [:index, :show]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :bookings, only:[:index, :show]
  get "booking/:id", to: "bookings#book", as: :book_event
  post "sendotp", to:"bookings#send_otp", as: :send_otp
  post "verifyotp", to: "bookings#verify_otp", as: :verify_otp
  get "ticket/:id", to: "bookings#ticket", as: :ticket
  get "mailticket/:id", to:"bookings#mail_ticket", as: :mail_ticket
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # match "*unmatched_route", to: redirect("/"), via: :all
  #  devise_scope :user do
  #   unauthenticated do
  #     root to: 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end

  
end
