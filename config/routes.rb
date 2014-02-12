SparkAcademy::Application.routes.draw do
  root :to => "home#index"


  #temporary
  devise_for :users, skip: [:registrations, :password]



  resources :beta_users, path: "/users"

  #blog routes
  resources :blogs, path: "/blog"
  get "/blog/:id/:title", to: "blogs#show", as: "blog_title"
  post '/blog/hack_and_tell', to: 'blogs#hack_and_tell'
  post "/newsletter", to: "newsletter_users#create" # has to go after resource!!!

=begin
  #tutorial routes
  resources :courses, except: ["show"] do
    resources :units, except: ["index", "show"] do
      resources :lessons, except: ["index", "show"]
    end
  end
  get "courses/:tag", to: "courses#show", as: "course_tag" #this will be show.  tag is to make it more use friendly
  get "courses/:tag/:lesson_number", #finds course by tag then looks for lesson relative to course
        to: "lessons#show",
        as: "course_tag_lesson",
        constraints: {lesson_number: /\d/} #makes it only integers


  #devise and user routes
  devise_for :users, :controllers => {:registrations => "registrations"}
  #resources :users


  #user homepage.  shows their current progress
  #get "dashboard", to: "dashboard#index"

=end

  #private mail url
  post "/_incoming_mail", to: "incoming_mail#parse"
  resources :incoming_mail, only: [:index, :destroy]

end
