Rails.application.routes.draw do
  root "articles#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :articles do
    resources :comments, only: [:new, :create, :destroy]
  end  
  get "fortune", to: "articles#fortune"
end
