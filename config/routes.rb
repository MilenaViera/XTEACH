# frozen_string_literal: true

Rails.application.routes.draw do
  get '/students', to: 'users#index'
end