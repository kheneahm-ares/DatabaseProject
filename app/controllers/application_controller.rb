class ApplicationController < ActionController::Base
  layout "layouts/application"
  include Clearance::Controller
  include ApplicationHelper
  protect_from_forgery with: :exception
end
