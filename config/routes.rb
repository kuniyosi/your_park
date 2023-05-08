Rails.application.routes.draw do
  
  scope module: :public do
  
    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }
  
    root to: 'homes#top'
    get '/about', to: 'homes#about'
  
  end
  
  namespace :admin do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  get '', to: 'homes#top'
  
  end
 
  
end
