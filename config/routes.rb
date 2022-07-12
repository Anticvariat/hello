Rails.application.routes.draw do

root "home#index"

get 'about_me', to: 'about_me#index'
get 'about_me/contact_me', to: 'about_me#contact_me'

resources :articles
resources :drafts
resources :all_articles
resources :about_me

devise_for :users

devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
 end
end
