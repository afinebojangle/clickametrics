Rails.application.routes.draw do

  resources :websites

  get 'home' => "welcome#home"

  devise_for :users
  root to: "welcome#home"

  namespace :api, defaults: { format: :json } do
    resources :events, only [:create]
  end
end
