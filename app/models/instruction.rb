class Instruction < ActiveRecord::Base
  attr_accessible :topic
  has_many :steps, :dependent => :delete_all

  validates :topic, :presence => true
end
