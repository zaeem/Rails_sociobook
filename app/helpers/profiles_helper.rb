module ProfilesHelper


def add_profile_university_link(name)
  link_to_function name do |page|
    page.insert_html :bottom, :profile_universities, :object => Profile_University.new
  end
end



end
