class Group < ActiveRecord::Base
  has_many :members
  has_many :profiles, :through => :members  
  accepts_nested_attributes_for  :members, :allow_destroy => true
  belongs_to :profile
  def Group.leavegroups(group_id, profile_id)
    group= Group.find(group_id)
    if(group.profile_id == profile_id)
      if group.members.blank?
        group.destroy
      else
        group.profile_id = group.members.first.profile_id
        group.save
        group.members.first.destroy
      end
    else
      m = group.members.find_by_profile_id(profile_id)
      m.destroy unless m.blank?
    end
  end
end
