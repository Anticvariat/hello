Rails.application.routes.draw do

root "home#index"

resources :articles
resources :drafts

devise_for :users

devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
 end
end
