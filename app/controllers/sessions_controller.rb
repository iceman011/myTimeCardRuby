class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :root]
  layout :false
  
  def new
  end
    
  def create
    emp = Emp.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if emp.present? && emp.authenticate(params[:password])
    # sets up user.id sessions
      session[:emp_id] = emp.id
      redirect_to emp_path(emp.id), notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:emp_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
  
end