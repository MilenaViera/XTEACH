# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  #get '/students', to: 'users#index'

  root to: "users#index"
end