class EmpsController < ApplicationController
  before_action :set_emp, only: %i[ show edit update destroy ]
  skip_before_action :authorized, only: [:new, :create]
  
  # GET /emps or /emps.json
  def index
    @emps = Emp.all
  end

  # GET /emps/1 or /emps/1.json
  def show
  end

  # GET /emps/new
  def new
    @emp = Emp.new
  end

  # GET /emps/1/edit
  def edit
  end

  # POST /emps or /emps.json
  def create
    @emp = Emp.new(emp_params)

    respond_to do |format|
      if @emp.save
        
        session[:emp_id] = @emp.id
        
        format.html { redirect_to @emp, notice: "Emp was successfully created." }
        format.json { render :show, status: :created, location: @emp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emps/1 or /emps/1.json
  def update
    respond_to do |format|
      if @emp.update(emp_params)
        format.html { redirect_to @emp, notice: "Emp was successfully updated." }
        format.json { render :show, status: :ok, location: @emp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emps/1 or /emps/1.json
  def destroy
    @emp.destroy
    respond_to do |format|
      format.html { redirect_to emps_url, notice: "Emp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emp
      @emp = Emp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emp_params
      params.require(:emp).permit(:user_name, :employee_id, :role, :email, :isManager, :password , :password_confirmation)
    end
end