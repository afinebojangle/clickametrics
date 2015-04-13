Rails.application.routes.draw do

  get 'home' => "welcome#home"

  devise_for :users
  root to: "welcome#home"
end
