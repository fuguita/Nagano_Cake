Rails.application.routes.draw do



  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

scope module: :public do
   resource :customers, only: [:show, :edit, :update, :withdraw]
   get 'customers/check' => "customers#check", as: 'check'
   get 'customers/information/edit' => "customers#information#edit", as: 'information_edit'
  end

   namespace :admin do
    resources :customers, only: [:index, :show, :edit]
  end

  root to: "homes#top"
  get 'homes/about' => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
