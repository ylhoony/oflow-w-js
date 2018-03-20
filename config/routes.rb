Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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

  resources :companies
  resources :employees
  put "switch", to: "employees#switch", as: :switch_employee

  resources :currencies, except: [:destroy]
  put "switch", to: "currencies#switch", as: :switch_currency
  
  resources :countries, except: [:destroy]
  put "switch", to: "countries#switch", as: :switch_country
  
end
