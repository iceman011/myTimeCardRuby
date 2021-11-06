class CardsController < ApplicationController
  before_action :get_emp
  before_action :set_card, only: [:show, :edit, :update, :destroy]

   
    def index
        #@emp = Emp.find(params[:emp_id])
        @cards = @emp.cards
    end 
    
    def new 
       @card = @emp.cards.build
    end 
    
    def create
      #@emp = Emp.find(params[:emp_id])
      #byebug
      #@card = @emp.cards.create(card_params)
      #@card =
      #puts @emp.id
      #@emp.cards.create!(card_params)
      #redirect_to emp_path(@emp)
      @card = @emp.cards.build(card_params)
      
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
      params.require(:card).permit(:emp_id, :clm_work_item_id, :task_type_id, :start_time, :end_time, :duration, :comment)
    end
    
    def get_emp
      @emp = Emp.find(params[:emp_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @emp.cards.find(params[:id])
    end
    
end