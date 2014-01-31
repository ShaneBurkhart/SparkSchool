SparkAcademy::Application.routes.draw do
  root :to => "home#index"

  #blog routes
  resources :blogs, path: "/blog"
  get "/blog/:id/:title", to: "blogs#show", as: "blog_title"
  post "/newsletter", to: "newsletter_users#create" # has to go after resource!!!


  #tutorial routes
  resources :courses, except: ["show"]
  get "courses/:tag", to: "courses#show", as: "course_tag" #this will be show.  tag is to make it more use friendly


  #devise and user routes
  devise_for :users, :controllers => {:registrations => "registrations"}
  #resources :users


  #user homepage.  shows their current progress
  #get "dashboard", to: "dashboard#index"


  #private mail url
  post "/_incoming_mail", to: "incoming_mail#parse"
  resources :incoming_mail, only: [:index, :destroy]

end
