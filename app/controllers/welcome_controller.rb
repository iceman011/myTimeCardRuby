class WelcomeController < ApplicationController
    skip_before_action :authorized, only: [:index, :root]

    def index
    end
    
end
