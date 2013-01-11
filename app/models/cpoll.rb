class Cpoll < ActiveRecord::Base
  belongs_to :content
  has_many :cpoptions
  has_many :cpshares
  accepts_nested_attributes_for :cpoptions, :allow_destroy => true
  accepts_nested_attributes_for :cpshares, :allow_destroy => true
  
  
  validates :question, :presence => true
end