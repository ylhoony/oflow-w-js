Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "nav_menu#index"

  get "dashboard", to: "nav_menu#dashboard", as: "nav_dashboard"
  get "demand", to: "nav_menu#demand", as: "nav_demand"
  get "supply", to: "nav_menu#supply", as: "nav_supply"
  get "product", to: "nav_menu#product", as: "nav_product"
  get "warehouse", to: "nav_menu#warehouse", as: "nav_warehouse"
  get "logistics", to: "nav_menu#logistics", as: "nav_logistics"
  get "report", to: "nav_menu#report", as: "nav_report"
  get "setup", to: "nav_menu#setup", as: "nav_setup"

  devise_for :users

  resources :companies

  put "employees/switch", to: "employees#switch", as: :switch_employee
  resources :employees
  
  put "currencies/switch", to: "currencies#switch", as: :switch_currency
  resources :currencies, except: [:destroy]
  
  put "countries/switch", to: "countries#switch", as: :switch_country
  resources :countries, except: [:destroy]

  put "payment_options/switch", to: "payment_options#switch", as: :switch_payment_option
  resources :payment_options, except: [:destroy]

  put "payment_terms/switch", to: "payment_terms#switch", as: :switch_payment_term
  resources :payment_terms

  resources :customers
  resources :suppliers
  resources :warehouses
  
end
