Rails.application.routes.draw do


  scope module: :public do

    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    resources :parks, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :park_comments, only: [:create, :destroy]
    end

    resources :customers, only: [:show, :edit, :update, :destroy] do
      get :bookmarks, on: :collection
    end

    root to: 'homes#top'
    get '/about', to: 'homes#about', as: 'about'

    get "search_park" => "parks#search_park"

    post "/search", to: "parks#search"
    get "/search", to: "parks#search"


  end

  namespace :admin do

    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }

    resources :parks, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
      resources :park_comments, only: [:destroy]
    end

    resources :customers, only: [:index, :show, :edit, :update, :destroy]

    get "search_park" => "parks#search_park"

    post "/search", to: "parks#search"
    get "/search", to: "parks#search"

  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

end