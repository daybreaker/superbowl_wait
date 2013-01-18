Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
 
  get 'observation' => 'destination#observation'
  get 'observation/:unique_id' => 'destination#observation'
  post 'observation' => 'destination#update'
  get 'destination/:unique_id' => 'destination#show'
  
  root :to => 'destinations#index'
end
