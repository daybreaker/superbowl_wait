Superbowl::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
 
  get 'observation' => 'destination#update'
  post 'observation' => 'destination#update'
  get 'observation/:unique_id' => 'destination#observation'
  get 'destination/observation' => 'destination#observation'
  post 'destination/observation' => 'destination#observation'
  get 'destination/:unique_id' => 'destination#show'
  
  root :to => 'destinations#index'
end
