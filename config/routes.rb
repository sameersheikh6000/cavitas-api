Rails.application.routes.draw do
  
  devise_for :users, only: [:sessions, :registrations],controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :rejected_files
      resources :client_infos
      resources :insured_clients, only: %i[index]
    end
  end
end
