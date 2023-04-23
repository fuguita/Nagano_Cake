Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

scope module: :public do
   root to: "homes#top"
   get 'homes/about' => "homes#about", as: 'about'
   resources :items, only: [:show, :index]
   resource :customers, only: [:show]
   get 'customers/check' => "customers#check", as: 'check'
   get 'customers/information/edit' => "customers#edit", as: 'information_edit_customers'
   patch 'customer/information' => "customers#update", as: 'information_customers'
   patch 'customers/withdraw' => "customers#withdraw", as: 'withdraw_customers'
  end

namespace :admin do
   get 'homes/top'
   resources :customers, only: [:index, :show, :edit]
   resources :genres, only: [:index,:create, :edit, :update]
   resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

# root to: "homes#top"
#   get 'homes/about' => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
