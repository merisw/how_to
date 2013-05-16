class Step < ActiveRecord::Base
  belongs_to :instruction
  attr_accessible :description, :order
  validates :order, :presence => true
  validates :description, :presence => true
end
