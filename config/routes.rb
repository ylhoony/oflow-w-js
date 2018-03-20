Rails.application.routes.draw do

  resources :companies
  root to: "nav_menu#index"

  get "dashboard", to: "nav_menu#dashboard"
  get "demand", to: "nav_menu#demand"
  get "supply", to: "nav_menu#supply"
  get "product", to: "nav_menu#product"
  get "warehouse", to: "nav_menu#warehouse"
  get "logistics", to: "nav_menu#logistics"
  get "report", to: "nav_menu#report"
  get "setup", to: "nav_menu#setup"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
