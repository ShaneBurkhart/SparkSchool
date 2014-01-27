SparkAcademy::Application.routes.draw do
  root :to => "home#index"
  resources :beta_users, path: "/users"

  resources :blogs, path: "/blog"
  get "/blog/:id/:title", to: "blogs#show", as: "blog_title"

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
