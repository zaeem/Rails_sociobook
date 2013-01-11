class ProfileGroup < ActiveRecord::Base
  belongs_to :profile
  has_many :friend_profile_groups, :dependent => :destroy
  validates :name, :presence => true
  validates_format_of :name, :with => /^[a-zA-Z]*$/
end
