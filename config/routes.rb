Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  devise_for :users, controllers: {omniauth_callbacks: "callbacks",
    registrations: "users"}

  scope "(:locale)", locale: /en|vi|ja/ do
    root "static_pages#home"

    resources :users
    resources :blogs
    resources :news
    resources :likes
    resources :comments
    resources :contacts
    resources :categories
    resources :like_blogs
    resources :projects do
      resources :participates
    end
    namespace :admin do
      root "admin#index"
      resources :homes
      resources :users
      resources :projects do
        resources :participates
      end
    end
    resources :messages
  end

  mount ActionCable.server => "/cable"
end
