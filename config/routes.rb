Rails.application.routes.draw do
  post 'api/v1/user' => 'api/v1/user#create'
end
