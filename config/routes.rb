Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: :about
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do 
      get :favorites
    end
  end 
  resources :eateries, only: [:new, :create, :show] do
    resource :favorite, only: [:create, :destroy]
  end 
  resources :reviews, only: [:create, :edit, :update, :destroy]
  resources :lodgings, only: [:new, :create, :show]
  get '/search', to: 'searches#search'

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    post 'approved/:id', to: 'dashboards#approved', as: :approved
    post 'approved/:id', to: 'lodging_dashboards#approved', as: :lodging_approved
    resources :dashboards, only: [:index, :show, :edit, :update, :destroy]
    resources :lodging_dashboards, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
