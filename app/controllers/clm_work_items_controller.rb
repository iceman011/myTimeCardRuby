class ClmWorkItemsController < ApplicationController
    before_action :force_json, only: :search
    
    def search
        q = params[:q].downcase
        @clm_work_items = ClmWorkItem.where("clm_parent_ref = ? or clm_child_ref = ?  ", 
         q , q ).limit(5)
    end
  
  private
    def force_json
      request.format = :json
    end
end
