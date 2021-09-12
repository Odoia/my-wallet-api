Rails.application.routes.draw do
  post 'api/v1/user' => 'api/v1/user#create'
  get 'api/v1/user/:id' => 'api/v1/user#show'

  post 'api/v1/wallet' => 'api/v1/wallet#create'
  get 'api/v1/wallet/:id' => 'api/v1/wallet#show'

  post 'api/v1/asset' => 'api/v1/asset#create'
  get 'api/v1/asset/:id' => 'api/v1/asset#show'

  post 'api/v1/financial_transactions' => 'api/v1/financial_transaction#create'
  get 'api/v1/financial_transactions/:id' => 'api/v1/financial_transaction#show'
end
