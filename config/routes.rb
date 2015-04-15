Rails.application.routes.draw do

  resources :websites

  get 'home' => "welcome#home"

  devise_for :users
  root to: "welcome#home"
end
