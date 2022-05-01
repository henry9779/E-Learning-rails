# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
end
