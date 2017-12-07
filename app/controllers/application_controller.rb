class ApplicationController < ActionController::Base
  layout "layouts/application"
  include Clearance::Controller
  include ApplicationHelper
  protect_from_forgery with: :exception

  
  def authenticate_admin!
    if current_user.isAdmin?
      super
    else
      redirect_to login_path, :notice => 'Access Denied'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

end
