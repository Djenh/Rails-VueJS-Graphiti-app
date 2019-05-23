Rails.application.routes.draw do
  root 'main#index'

  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :books
    resources :authors
    resources :libraries
    resources :universities
  end

  get '/owner', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
