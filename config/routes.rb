Rails.application.routes.draw do
  
  resources :account_orders
  resources :products
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
  resources :company_contacts
  resources :company_addresses

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

  put "freight_terms/switch", to: "freight_terms#switch", as: :switch_freight_term 
  resources :freight_terms

  put "product_categories/switch", to: "product_categories#switch", as: :switch_product_category
  resources :product_categories

  put "product_groups/switch", to: "product_groups#switch", as: :switch_product_group
  resources :product_groups

  put "unit_of_measures/switch", to: "unit_of_measures#switch", as: :switch_unit_of_measure
  resources :unit_of_measures

  resources :customers do 
    resources :account_addresses
  end

  resources :suppliers do
    resources :account_addresses
  end

  resources :warehouses
  
end
