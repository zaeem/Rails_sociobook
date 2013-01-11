include ApplicationHelper
class HomeController < ApplicationController

  autocomplete :profile, :contact_currentcity
  autocomplete :profile, :contact_town
  autocomplete :profile, :languages
  autocomplete :profile, :relation_status
  autocomplete :profile, :religion_name
  autocomplete :profile, :tv
  autocomplete :profile_employer, :title
  autocomplete :profile_employer, :position
  autocomplete :profile_employer, :city
  autocomplete :profile_employer, :project
  autocomplete :profile_employer, :with
  autocomplete :profile_university, :title
  autocomplete :profile_university, :website
  autocomplete :profile_university, :concentration
  autocomplete :profile_university, :classname
  autocomplete :profile_university, :attendedfor
  autocomplete :profile_university, :with
  autocomplete :profile_music, :title
  autocomplete :profile_book, :title
  autocomplete :profile_movie, :title
  autocomplete :profile_game, :title
  autocomplete :profile_play_sport, :title
  autocomplete :profile_team_sport, :title
  autocomplete :profile_player_sport, :name
  autocomplete :profile_activity, :name
  autocomplete :profile_interest, :name
  autocomplete :profile_relation, :family_name
  autocomplete :profile_relation, :family_relation
  autocomplete :profile_ppl_inspiration, :name
  autocomplete :profile_ppl_inspiration, :title

  before_filter :require_user

  def show
    @main_menus = true 

    redirect_to ewall_contents_path(:id => current_user.profile.id ,:sk => 'status', :pv => 'f',  :vd => 0) 
  end
  
  def upload_pic
    @user = current_user
    @step = 3
  end
  
  def vprofile
    @wall_menus = true
    @id = params[:id]
    @vuser = get_userfirst(@id)
    @vprofile = Profile.find(@id)
  end 
  
  def eprofile
    @sk = params[:sk]
    @profile=current_user.profile
    @edit_menus =true
  end
  
  def profile_university
  end
  
  def edit_basic
    @profile=current_user.profile
  end
 
  def upload_picture
    current_user.attributes =  params[:user] 
    current_user.save(false)
    flash[:notice] = "Picture has been uploaded successfully."
    return redirect_to upload_pic_home_path
  end

  def edit_picture
    current_user.attributes = params[:user] 
    current_user.avatar = File.new(upload_path) if params[:from] == "webcam_picture"
    if current_user.save
      return redirect_to eprofile_home_url(@sk, :sk => "picture") 
    else   
      @error = []
      current_user.errors.full_messages.each do |msg|
        @error << "#{msg}" unless msg.blank?
      end
      flash[:notice] = @error  
      return redirect_to eprofile_home_url(@sk, :sk => "picture") 
    end
  end

  def take_picture # is used in upload webcam pic
    File.open(upload_path, 'w') do |f|
      f.write request.raw_post.force_encoding("UTF-8")
    end
    return render :text => "ok"
  end

  private
  def upload_path # is used in upload webcam pic
    file_name = session[:session_id].to_s + '.jpg'
    File.join(Rails.root.to_s, 'public', 'uploads', file_name)
  end
  
end