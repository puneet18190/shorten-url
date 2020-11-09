Rails.application.routes.draw do
  resources :records
  get 'home/index'

  root 'records#index'

  get '/s/:id' => 'records#search_url'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
