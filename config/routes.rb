# frozen_string_literal: true

Rails.application.routes.draw do
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
      resources :books, only: [:index, :show] 
    end
  end

  # For details on  the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
