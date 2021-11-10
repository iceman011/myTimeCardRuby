class Card < ApplicationRecord
  belongs_to :emp
  
  has_many :entries, :dependent => :destroy
  accepts_nested_attributes_for :entries, :reject_if => lambda { |a| a[:duration].blank? }, :allow_destroy => true

end
