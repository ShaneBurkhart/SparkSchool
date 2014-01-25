SparkAcademy::Application.routes.draw do
  root :to => "home#index"
  resources :beta_users, path: "/users"
  #devise_for :users, :controllers => {:registrations => "registrations"}
  #resources :users
end
