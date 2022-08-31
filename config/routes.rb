# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'about_me', to: 'about_me#index'
  get 'about_me/contact_me', to: 'about_me#contact_me'

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  resources :drafts, only: [:index]
  resources :all_articles, only: [:index]
  resources :about_me, only: [:index, :create]

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users', to: 'devise/registrations#new'
  end
end
