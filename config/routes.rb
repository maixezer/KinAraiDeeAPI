Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, skip: [
    :sessions,
    :registrations,
    :confirmations,
    :passwords]

  devise_scope :user do
    post '/api/v1/users', to: 'registrations#create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api/v1', module: 'api/v1' do
    resources :users, only: [:index, :show]
  end
end
