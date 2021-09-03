Rails.application.routes.draw do
  get 'home/index'
  root 'home#new'
  post 'home/create'
  get '/a/:slug', to: 'home#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
