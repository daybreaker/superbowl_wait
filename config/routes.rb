Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  match 'show' => 'section#show'
  match 'get_image' => 'section#get_image'
  match 'destinations/manual_entry' => 'catalog#view'
  
  root :to => 'section#index'
end
