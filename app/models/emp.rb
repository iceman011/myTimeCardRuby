class Emp < ApplicationRecord
     has_many :cards , dependent: :destroy
    
    def cards_count
        self.cards.size
    end
end
