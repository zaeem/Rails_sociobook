class Cpoption < ActiveRecord::Base
  belongs_to :cpoll
  validates :optiontext, :presence => true
end
