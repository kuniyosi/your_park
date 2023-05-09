Rails.application.routes.draw do

  namespace :public do
    get 'parks/show'
    get 'parks/index'
  end
  scope module: :public do

    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }

    resources :parks, only: [:index, :show]

    root to: 'homes#top'
    get '/about', to: 'homes#about'

  end

  namespace :admin do

    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
    }

    resources :parks, only: [:index, :show, :new, :edit, :create, :update, :destroy]

    get '', to: 'homes#top'

  end


end
