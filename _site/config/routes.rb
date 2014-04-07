SparkAcademy::Application.routes.draw do
  get "preorders/show"
  get "preorders/create"
  root :to => "home#index"

  resource :preorder, only: [:show, :create]

  #blog routes
  resources :blogs, path: "/blog"
  get "/blog/:id/:title", to: "blogs#show", as: "blog_title"
  post "/newsletter", to: "newsletter_users#create" # has to go after resource!!!

  #tutorial routes
  resources :courses, except: ["show"] do
    resources :units, except: ["index", "show"] do
      resources :lessons, except: ["index", "show"]
    end
  end

=begin
  get "courses/:tag", to: "courses#show", as: "course_tag" #this will be show.  tag is to make it more use friendly
  get "courses/:tag/:lesson_number", #finds course by tag then looks for lesson relative to course
        to: "lessons#show",
        as: "course_tag_lesson",
        constraints: {lesson_number: /\d/} #makes it only integers
=end

  #only admins need this
  devise_for :users, skip: [:registration, :password]


  #user homepage.  shows their current progress
  #get "dashboard", to: "dashboard#index"


  #private mail url
  post "/_incoming_mail", to: "incoming_mail#parse"
  resources :incoming_mail, only: [:index, :destroy]

end
