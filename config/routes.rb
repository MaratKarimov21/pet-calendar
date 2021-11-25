# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'
  
  get 'pages/profile', to: 'pages#profile', as: 'profile'

  resource :contacts, only: %i[new create]
  resources :events
end
