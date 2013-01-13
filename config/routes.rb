Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  match 'show/:section' => 'section#show'
  match 'show' => 'section#show'
  match 'get_image' => 'section#get_image'
  get 'observation' => 'destination#observation'
  post 'observation' => 'destination#update'
  
  root :to => 'section#show'
end
