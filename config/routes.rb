Rails.application.routes.draw do
  post 'api/v1/user' => 'api/v1/user#create'
  get 'api/v1/user/:id' => 'api/v1/user#show'

  post 'api/v1/wallet' => 'api/v1/wallet#create'
  get 'api/v1/wallet/:id' => 'api/v1/wallet#show'

  post 'api/v1/active' => 'api/v1/active#create'
  get 'api/v1/active/:id' => 'api/v1/active#show'
end
