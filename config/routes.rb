require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    
    scope module: :v1,
          contraints: ApiConstraints.new(version: 1, default: true) do
      resources :denuncias
    end  
  end
end
