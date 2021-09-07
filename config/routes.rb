Rails.application.routes.draw do
  post 'api/v1/user' => 'api/v1/user#create'
  get 'api/v1/user/:id' => 'api/v1/user#show'
end
