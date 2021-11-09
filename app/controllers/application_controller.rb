class ApplicationController < ActionController::Base
    #before_action :set_current_emp
    
    before_action :authorized
    helper_method :current_emp
    helper_method :logged_in?
    helper_method :admin?

    #def set_current_emp
      # finds user with session data and stores it if present
    #  Current.emp = Emp.find_by(id: session[:emp_id]) if session[:emp_id]
    #end
    
    #def require_emp_logged_in!
    #  # allows only logged in user
    #  redirect_to root_path, alert: 'You must be signed in' if Current.emp.nil?
    #end
    
    def logged_in?
      Rails.logger.debug  "Ez-logged_in? #{!current_emp.nil?}"
      !current_emp.nil?  
    end

    def admin?
      true
    end
    
    def current_emp
      Rails.logger.debug  "Ez-current_emp->session[emp_id]  #{session[:emp_id]}"
      if session[:emp_id] != nil
        return Emp.find_by(id: session[:emp_id])
      else
        return nil
      end
    end
    
    def authorized
      Rails.logger.debug  'Ez-authorized ' 
      redirect_to root_path unless ( logged_in? and current_permission.allow?(params[:controller], params[:action]) )
    end

    delegate :allow?, to: :current_permission
    helper_method :allow?
    
    private
    def current_permission
      @current_permission ||= Permission.new(current_emp)
    end

end
