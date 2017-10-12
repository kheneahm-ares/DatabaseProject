class ApplicationController < ActionController::Base
  layout "layouts/application"
  include Clearance::Controller
  protect_from_forgery with: :exception
end
