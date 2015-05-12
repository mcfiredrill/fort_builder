Rails.application.routes.draw do
  resources :posts
  resources :uploads
  get "/sign", to: "uploads#sign"
end
