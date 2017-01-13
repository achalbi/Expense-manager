Rails.application.routes.draw do
  get 'expense_manager/dashboard'

   resources :users,:lunch_details
   resources :daily_invoices
   match "daily_details" => "daily_invoices#daily_details", :as => :daily_details, :via => [:get, :post]
   match "/"=> "expense_manager#dashboard",:via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
