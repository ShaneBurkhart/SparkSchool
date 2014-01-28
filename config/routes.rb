SparkAcademy::Application.routes.draw do
  root :to => "home#index"

  #blog routes
  resources :blogs, path: "/blog"
  get "/blog/:id/:title", to: "blogs#show", as: "blog_title"
  post "/newsletter", to: "newsletter_users#create" # has to go after resource!!!


  devise_for :users, :controllers => {:registrations => "registrations"}
  #resources :users
end
