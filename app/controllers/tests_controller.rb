class TestsController < ApplicationController

    def create
        @card = Card.find(params[:card_id])
        @test = @card.tests.create!(test_params)
        redirect_to card_path(@card)
    end
    
    private
    
    def test_params
        params.require(:test).permit(:comment)
    end
    
end
