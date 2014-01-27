SparkAcademy::Application.routes.draw do
  root :to => "home#index"
  resources :beta_users, path: "/users"

  resources :blogs, path: "/blog", except: ["show"]
  get "/blog/:id/:title", to: "blogs#show"

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
