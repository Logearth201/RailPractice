# coding: utf-8
Rails.application.routes.draw do
  resources :members do
    collection { get "search" }
    member { put "suspend" , "restore"}
  end
  resources :articles
  resource :session, only: [ :create, :destroy ]
  get "index" => "index#index"
  get "about" => "index#about"
  get "favorite" => "index#favorite"
  get "login" => "index#login"
  get "link" => "index#link"
  get "play" => "articles#index"
  get "articles" => "articles#index"
  get "" => "index#index"
  get "det" => "getter#review_content"
  match "signup",  to: "members#new", via: "get"
end
