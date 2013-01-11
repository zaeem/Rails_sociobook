 class Profile < ActiveRecord::Base

#after_save :create_album!

 
belongs_to :user
has_many :profile_activities
has_many :profile_books
has_many :profile_employers
has_many :profile_games
has_many :profile_interests
has_many :profile_movies
has_many :profile_musics
has_many :profile_play_sports
has_many :profile_player_sports
has_many :profile_ppl_inspirations
has_many :profile_team_sports
has_many :profile_universities
has_many :profile_users
has_many :profile_relations

has_many :pemails
has_many :pneighbours
has_many :pphones
has_many :pscreens
has_many :pwebsites

has_many :friends
has_many :profile_groups
has_many :contents #,:through => :albums
has_many :contacts
has_many :members
has_many :groups, :through => :members


  
  
accepts_nested_attributes_for  :profile_activities, :reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_books,  :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_employers,:reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_games,:reject_if =>  proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_interests,:reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_movies, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_musics,:reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_play_sports, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_player_sports,:reject_if =>  proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_ppl_inspirations, :reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_team_sports, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_universities, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :profile_users, :allow_destroy => true
accepts_nested_attributes_for  :profile_relations, :reject_if => proc { |attributes| attributes['family_name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for :pemails, :reject_if => proc { |attributes| attributes['email'].blank? }, :allow_destroy => true
accepts_nested_attributes_for :pneighbours, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
accepts_nested_attributes_for :pphones, :reject_if => proc { |attributes| attributes['phoneno'].blank? }, :allow_destroy => true
accepts_nested_attributes_for :pscreens, :reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
accepts_nested_attributes_for :pwebsites, :reject_if => proc { |attributes| attributes['url'].blank? }, :allow_destroy => true
accepts_nested_attributes_for  :friends, :allow_destroy => true
accepts_nested_attributes_for  :contents, :allow_destroy => true
#accepts_nested_attributes_for  :albums, :allow_destroy => true

   
  validates_associated :profile_books
  validates_associated :profile_relations  
  validates_associated :profile_universities 
  validates_associated :profile_employers
  validates_associated :profile_ppl_inspirations
  validates_associated :profile_musics  
  validates_associated :profile_books 
  validates_associated :profile_movies
  validates_associated :profile_games
validates_associated :profile_activities
validates_associated :profile_interests

validates_associated :profile_play_sports
validates_associated :profile_player_sports
validates_associated :profile_team_sports

validates_associated :pemails
validates_associated :pneighbours
validates_associated :pphones
validates_associated :pscreens
validates_associated :pwebsites

   
  
  validates_format_of :religion_name, :languages, :religion, :contact_town, :contact_currentcity, :contact_screenname, :with => /^[a-zA-Z]*$/
  validates_format_of :contact_phone, :contact_mobile, :contact_zipcode, :with => /^[0-9]*$/
  
 
  
def profile_university_attributes=(profile_university_attributes)
  profile_university_attributes.each do |attributes|
    profile_universities.build(attributes)
  end
end

def default_album_content
  self.contents.find_by_name("default")
end


#
#  def create_profile!
#    if self.profile.blank?
#    self.profile = Profile.new(:user_id => self.id) 
#    self.profile.save(false)
#    end
#  end 


#
#  def create_album!
#   
#    self.alnew(:profile_id => self.id, :name => "default") 
#    self.save(false)
#   end 
  
  

end