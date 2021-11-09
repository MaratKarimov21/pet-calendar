# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'
  #get '/main/:year/:month', to: 'pages#main'
  
  resources :events
end
