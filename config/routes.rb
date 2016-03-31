NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'

  resources :users

  root 'cats#index'
end
