class ProfileController < ApplicationController
    #this controller is only accessible to logged in users

    #a clearance method that requires login to access these methods
    before_action :require_login

    def index
    end

end
