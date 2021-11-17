class CardsController < ApplicationController
  before_action :get_emp
  before_action :set_card, only: [:show, :edit, :update, :destroy]

   
    def index
        #@emp = Emp.find(params[:emp_id])
        @cards = @emp.cards
    end 
    
    def new 
       @card = @emp.cards.build
       
       default_start = Date.today.beginning_of_week(start_day = :sunday)
       default_end = Date.today.beginning_of_week(start_day = :sunday)
       
       default_start = Time.zone.at(default_start.to_time).to_datetime
       default_end = Time.zone.at(default_end.to_time).to_datetime

       default_start = default_start.change(hour: 8)
       default_end = default_end.change(hour: 16)
       
       @card.start_time = default_start
        5.times do
          entry = @card.entries.build
          entry.start_time = default_start
          entry.end_time = default_end
          
          
          
          diff = ((default_end- default_start) * 24 ).round 
          entry.duration = '0d '+ diff.to_s + 'h 0m'
          #byebug
          

          #puts default_end.to_s() + ' ' + default_start.to_s() 
          
          default_start = default_start + 1
          default_end = default_end + 1
          #4.times { question.answers.build }
        end
  
    end 
    
    def create
      #@emp = Emp.find(params[:emp_id])
      #byebug
      #@card = @emp.cards.create(card_params)
      #@card =
      #puts @emp.id
      #@emp.cards.create!(card_params)
      #redirect_to emp_path(@emp)
     
      #@card = @emp.cards.build(card_params)
      @card = Card.new(card_params)
      respond_to do |format|
        if @card.save
          format.html { redirect_to emp_path(@emp), notice: 'Card was successfully created.' }
          format.json { render :show, status: :created, location: @card }
        else
          format.html { render :new }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # PATCH/PUT /card/1
  # PATCH/PUT /card/1.json
    def update
      respond_to do |format|
        if @card.update(card_params)
          format.html { redirect_to emp_path(@emp), notice: 'Card was successfully updated.' }
          format.json { render :show, status: :ok, location: @card }
        else
          format.html { render :edit }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    end
    
      # DELETE /cards/1 or /cards/1.json
    def destroy
        #@card = Card.find(params[:id])
        @card.destroy
        respond_to do |format|
          format.html { redirect_to emp_path(@emp), notice: "card was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private
    
    def card_params

      params.require(:card).permit(:emp_id, :clm_work_item_id, :task_type_id, :start_time, :end_time, :duration, :comment , 
      { entries_attributes: [ :_destroy, :card_id, :clm_work_item_id, :task_type_id, :start_time, :start_time_t , :end_time, :end_time_t, :duration, :comment]} )
    end
    
    def get_emp
        @emp = Emp.find(params[:emp_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @emp.cards.find(params[:id])
    end
    
end