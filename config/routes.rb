Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
 
  get 'observation' => 'destination#update'
  get 'observation/:unique_id' => 'destination#observation'
  post 'observation' => 'destination#update'
  get 'destination/:unique_id' => 'destination#show'
  
  match 'get_image' => 'destination#get_image'
  
  root :to => 'destination#index'
end
