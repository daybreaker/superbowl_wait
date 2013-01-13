class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :body_class

  def body_class    
    @body_class = "domewait"
  end

end
