Rails.application.routes.draw do
  root to: 'trends#index'
  get '/tallying' => 'trends#tallying', as: "tallying"
  get '/:word' => 'trends#show', as: 'show'
end
