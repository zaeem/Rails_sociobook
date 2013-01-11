module GroupsHelper
  
  def findgroups(profile_id)
    #    Group.all(:conditions => ["profile_id = #{profile_id} OR id in (select group_id from members where profile_id = #{profile_id})" ], :select => "distinct(id)" )
    Group.all(:conditions => ["profile_id = #{profile_id} OR id in (select group_id from members where profile_id = #{profile_id})" ] )
    
  end
  
  def leavegroups(group_id, profile_id)
    group= Group.find(group_id)
    if (group.profile_id == profile_id)
      if group.members.blank?
        group.destroy
      else
        group.profile_id = group.members.first.profile_id
        group.members.first.destroy
      end
    else
      puts "================================== I dont knw anything"
      m = group.members.find_by_profile_id(profile_id)
      m.destroy unless m.blank?
    end
  end



end
