Rails.application.routes.draw do

  get 'lodging_reviews/create'
  get 'lodging_reviews/edit'
  get 'lodging_reviews/update'
  get 'lodging_reviews/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: :about
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :favorites
      get :lodging_favorites
      patch :withdraw
      put :withdraw
    end
  end

  resources :eateries, only: [:new, :create, :show] do
    resource :favorite, only: [:create, :destroy]
  end
  resources :reviews, only: [:create, :edit, :update, :destroy]

  resources :lodgings, only: [:new, :create, :show] do
    resource :lodging_favorite, only: [:create, :destroy]
  end
  resources :lodging_reviews, only: [:create, :edit, :update, :destroy]

  get '/search', to: 'searches#search'


  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    post 'approved/:id', to: 'dashboards#approved', as: :approved
    post 'lodging_approved/:id', to: 'lodging_dashboards#approved', as: :lodging_approved
    resources :dashboards, only: [:index, :show, :edit, :update, :destroy]
    resources :lodging_dashboards, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :destroy] do
      member do
        patch :withdraw
        put :withdraw
      end
    end
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
