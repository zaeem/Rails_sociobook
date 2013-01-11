class User < ActiveRecord::Base
  
  before_save :create_profile!
  
  has_one :profile
  acts_as_authentic
  has_many :chats
  has_attached_file :avatar, :styles => { :medium => "600x600>", :thumb => "300x300>"}  ,:default_url => 'default_thumbnail.png',:thumb => 'default_thumbnail.png'
  #validates_attachment_presence :avatar, :on => :update
  validates_attachment_size :avatar, :less_than => 3.megabytes, :on => :update
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :on => :update

  validates :first_name, :last_name, :email, :gender, :birth_date, :presence => true
  validates_presence_of :password, :on => :create
  validates_confirmation_of :email
  validate :dob_check
  def dob_check
    errors.add(:birth_date, "must be greater then 15 years") if((self.birth_date.to_date + 15.years) > Date.today)
  end
  validates_format_of :first_name, :with => /^[a-zA-Z]*$/
  validates_format_of :last_name, :with => /^[a-zA-Z]*$/
  # FNAME VALIDATIONS
  validates_length_of :first_name, :within => 1..255
  # FNAME VALIDATIONS
  validates_length_of :last_name, :within => 1..255
  validates_inclusion_of :gender, :in => %w(male female),
    :message => "%{value} should be selected from the list"
  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def create_profile!
    if self.profile.blank?
    self.profile = Profile.new(:user_id => self.id) 
    self.profile.save(false)
#    self.profile.albums.create(:name => "default");
    self.profile.contents.create(:name => "default");
    end
  end 
  
  
end
