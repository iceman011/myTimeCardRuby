class TaskTypesController < ApplicationController
  before_action :force_json, only: :search
  
  def index
  end
  
  def show
  end
  
  def search
    q = params[:q].downcase
    @tasktypes = TaskType.where("name ILIKE ? ", "%#{q}%").limit(5)
  end
  
  private
    def force_json
      request.format = :json
    end
  
end
