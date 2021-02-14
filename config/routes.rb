Rails.application.routes.draw do
  
  
  resources :comments
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
    get '/sign_in', to: 'devise/sessions#new', as: :sign_in
  end

  root to: "campaigns#index"
  resources :campaigns do 
  	resources :discussions
  end

  concern :commentable do
    resources :comments
  end
  resources :campaigns, concerns: :commentable
  resources :discussions, concerns: :commentable

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
