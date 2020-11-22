Rails.application.routes.draw do
  mount_devise_token_auth_for 'Account', at: '/v1/authentication'
  namespace :v1 do
    namespace :user do
      resources :items, only: [:index]
    end
    namespace :master do
      resources :books, only: [:index]
      resources :authors, only: [:index]
      resources :circles, only: [:index]
    end
  end
end
