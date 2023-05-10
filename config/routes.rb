Rails.application.routes.draw do


  scope module: :public do

    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }

    resources :parks, only: [:index, :show] do
      resources :park_comments, only: [:create, :destroy]
    end

    resources :customers, only: [:show, :edit, :update, :destroy]

    root to: 'homes#top'
    get '/about', to: 'homes#about'

  end

  namespace :admin do

    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
    }

    resources :parks, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
      resources :park_comments, only: [:destroy]
    end

    resources :customers, only: [:index, :show, :edit, :update, :destroy]

    get '', to: 'homes#top'

  end


end
