# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope :api do
    scope :v1 do
      devise_for :users,
                 path: '',
                 path_names: {
                   sign_in: 'users/sessions',
                   sign_out: 'logout',
                   registration: 'users'
                 },
                 controllers: {
                   sessions: 'sessions',
                   registrations: 'registrations'
                 }
      resources :books, only: %i[index show]
      post '/suggestion', to: 'book_suggestion#create'
      get '/suggestion', to: 'book_suggestion#index'
      resources :rents, only: %i[index create]
    end
  end

  # For details on  the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
