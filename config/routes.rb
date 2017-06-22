Rails.application.routes.draw do
  root "static_pages#home", page: "home"
  get "static_pages/about"
  get "/staticpages/:page" => "static_pages#home", as: "page"

  devise_for :users
end
