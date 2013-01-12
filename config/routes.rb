Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  match 'show/:section' => 'section#show'
  match 'show' => 'section#show'
  match 'destinations/manual_entry' => 'catalog#view'
  
  root :to => 'section#index'
end
