class CardsController < ApplicationController
  
    
    def create
        @emp = Emp.find(params[:emp_id])
        #byebug
        #@card = @emp.cards.create(card_params)
        #@card =
        puts @emp.id
        
        @emp.cards.create!(card_params)
        redirect_to emp_path(@emp)
    end

    private
    def card_params
      params.require(:card).permit(:emp_id, :clm_work_item_id, :task_type_id, :start_time, :end_time, :duration, :comment)
    end
    
end