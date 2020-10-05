Rails.application.routes.draw do
  namespace :v1 do
    get '/search' => 'trends#search'
    resources :trends, only: [:index]
  end
end
