# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'about_me', to: 'about_me#index'
  get 'about_me/contact_me', to: 'about_me#contact_me'

  resources :articles
  resources :drafts
  resources :all_articles
  resources :about_me

  #devise_for :users
  devise_for :users, :controllers => {:registrations => 'users/registrations'}

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/users', to: 'devise/registrations#new'
  end
end
