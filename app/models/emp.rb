class Emp < ApplicationRecord
     has_many :cards , dependent: :destroy

    def cards_count
        self.cards.size
    end
    
    # adds virtual attributes for authentication
     has_secure_password
     # validates email
     validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

end
