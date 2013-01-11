module ApplicationHelper  

  def ng_first_text(ngdoc, path)
    ngdoc.xpath(path).first.text unless ngdoc.xpath(path).blank?
  end

  def ng_first_attribute(ngdoc, path, attribute)
    ngdoc.xpath(path).first[attribute] unless ngdoc.xpath(path).blank?
  end

  def ng_relevant_images(ngdoc)
    ngdoc.xpath('//body//img').reject {|i| i["alt"].blank? }.map {|i| i["src"]}
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end
  
  def link_to_add_partial_fields(name, f, association, partial)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partial + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end

  def link_to_like_fields(name, f, association, partial)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partial + "_fields", :f => builder)
    end
    link_to_function(name, ("add_like_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end
    
  def link_to_comment_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_comment_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end

    def link_to_add_option_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_option_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end

  
  def link_to_like_without_share_fields(name, f, association, partical)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partical + "_fields", :f => builder)
    end
    link_to_function(name, ("add_like_without_share_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end
    
  def link_to_comment_without_share_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_comment_without_share_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end

  


  
  #  def add_child_link(name, form_builder, association, after = nil, styles = nil)
  #    object = form_builder.object.class.reflect_on_association(association).klass.new
  #    partial = "#{association.to_s.singularize}_fields"
  #    template = content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
  #      form_builder.fields_for(association, object, :child_index => "new_#{association}") do |f|
  #        render(:partial => partial, :locals => { :f => f })
  #      end
  #    end
  #    template + link_to(name, "javascript:void(0)", :class => "add_child", :"data-association" => association, :after => after, :style => styles)
  #  end


  def find_all_friends
    return Friend.find_all_friends(current_user)
#    profiles_friends = current_user.profile.friends.where("status = ?","friend").map(&:friend_id)
#    profiles = Profile.where(:id => profiles_friends).map(&:user_id)
#    return User.where(:id => profiles)
  end

  def is_friend(profile_id,friend_id)
    return Friend.is_friend(profile_id, friend_id)
#    find_friends_id =  Friend.find(:all, :conditions=>["profile_id = ? and friend_id = ? and status = ?",
#                      profile_id ,friend_id,"friend"]).map(&:id)
#   if (find_friends_id.empty?)
#      return false
#    else
#      return true
#    end
  end

  def mutual_friends(current_user)
    Friend.mutual_friends(current_user)
  end

  def find_friends_in_group(group_id)
    friends_ids = FriendProfileGroup.where(:profile_group_id => group_id).map(&:friend_id)
    profiles_friends = Friend.where(:id => friends_ids).map(&:friend_id)
    profiles = Profile.where(:id => profiles_friends).map(&:user_id)
    return User.where(:id => profiles)
  end

  def get_friends_suggestion()
    return Friend.fetch_friends_suggestion(current_user)
  end


   def get_user(profile_id)
     profiles = Profile.where(:id => profile_id).map(&:user_id)
    return User.where(:id => profiles)
    end

   def get_userfirst(profile_id)
     profiles = Profile.where(:id => profile_id).map(&:user_id)
     return User.where(:id => profiles).first
  end
 end
