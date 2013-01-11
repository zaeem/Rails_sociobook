include ContentsHelper
include ApplicationHelper

class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.xml
  before_filter :require_user

  def index
    @contents = Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    @content = Content.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content }
    end
  end

  
  def valbum
    @wall_menus =true
    @vpid = params[:profile_id]
    @vcid = params[:content_id]
    @vprofile=Profile.find(params[:vpid])
    @vuser = get_userfirst(@vprofile)
    @viewalbum =true
  end

  def valbum_removephoto
    @cphoto = Cphoto.find(params[:id])
    @cphoto.destroy
    @photos= album_photos(params[:vpid], params[:vcid])
    if( !@photos.blank?)
      @wall_menus =true
      redirect_to valbum_contents_path(:vpid => params[:vpid] ,:vcid => params[:vcid] )
    else
      if( content_defaultalbum_id(params[:vpid]) != params[:vcid])
        @content = Content.find(params[:vcid])
        @content.destroy
      end
      redirect_to ewall_contents_path(:id => params[:vpid] ,:sk => 'status', :pv => 'w',  :vd => 0) 
    end
  end

  def valbum_makeprofile
    @cphoto = Cphoto.find(params[:id])
    current_user.avatar = @cphoto.photo
    if current_user.save
      redirect_to listalbum_contents_path( :profile_id => params[:vpid]) 
    else   
      @error = []
      current_user.errors.full_messages.each do |msg|
        if !msg.blank?
          @error << "#{msg}"
        end
      end
      flash[:notice] = @error  
      redirect_to listalbum_contents_path( :profile_id => params[:vpid]) 
    end
  end 

  def tag_photo
    @wall_menus = true
    @vprofile=Profile.find(params[:vpid])
    @vuser = get_userfirst(@vprofile)
    @photo = Cphoto.find(params[:id])
    @comment_id = params[:comment_id]
  end 
  
  def add_tag
    @tag = Ctag.new
    @tag.cphoto_id = params[:photo]
    @tag.width = params[:width]
    @tag.height = params[:height]
    @tag.label = params[:label]
    @tag.top = 100
    @tag.left = 150
    @tag.save
    
    @user = User.find_by_first_name(params[:label])
    if @user != nil
      @comment = Ccomment.new
      @photo = Cphoto.find(params[:photo])
      @comment.content_id = @photo.content_id
      @comment.misc = @photo.id
      @comment.desc = @comment.type_= 'phototag'
      @comment.profile_id = current_user.profile.id
      @comment.postedagainst = @user.profile.id
      @comment.save
    end
  end 

  def remove_tag
    @ctag = Ctag.find(params[:id])
    @ctag.destroy
    @comment = Ccomment.find(params[:comment_id])
    if @comment!=nil
      @comment.destroy
    end  
  end
  
  
  def listalbum
    @vpid = params[:profile_id]
	  @wall_menus =true
    @vprofile=Profile.find(params[:profile_id])
    @vuser = get_userfirst(@vprofile)    
  end
  
  # GET /contents/1
  # GET /contents/1.xml
  def ewall
    @sk = params[:sk]
    @pv = params[:pv]
    @vd = params[:vd]
    @v_profile=Profile.find(params[:id])
    @vprofile=Profile.find(params[:id]).id
    @vuser = get_userfirst(@vprofile)
    if(@pv == 'w')
      @wall_menus =true
    else
      @main_menus = true  
    end
    @content = Content.new
    
    @profile=current_user.profile
    @content.cpoll = Cpoll.new
    @content.cstatus = Cstatus.new
    @content.cevent = Cevent.new
    @content.cadd = Cadd.new
    
    @content.clink = Clink.new
    @content.cvideo = Cvideo.new
    @content.cphotos.build
    @content.ccomments.first || @content.ccomments.build# = Ccomment.new
    @sharecount = -1
  end 

  # GET /contents/new
  # GET /contents/new.xml
  def new
    #    return render :text => request.server_name
    @content = Content.new#.photoalbum_id = 1
    #@ccomment = Ccomment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  def rename_command(file_name)
    source = File.open(SVIDEO_FILE_NAME, File::RDONLY)
    
    destination_path = File.join(File.dirname(source.path), "#{file_name}")
    command = "cp #{source.path} #{destination_path}"
    return command
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])

    if @content.type_ == "svideo"
      t=Time.now.hour.to_s+Time.now.min.to_s+Time.now.sec.to_s
      @file_name = current_user.profile.id.to_s+t.to_s+".flv"
      @content.cvideo.video_file_name =@file_name
      system(rename_command(@file_name))
      #system("rm /home/zaeem/work/sociobook/public/svideo/output.flv")
    end
    respond_to do |format|
      if @content.save
        if (@content.type_ == "video")
          @content.cvideo.convert
          #@vi = Cvideo.find(@content.cvideo.ited)
        end
        if (params[:tags]=="yes")
          @profile_ids = Profile.where(:user_id => params[:tag_friends]).map(&:id)
          if !@profile_ids.blank?
            for profile in @profile_ids
              @comment = Ccomment.new
              @comment.content_id = @content.id
              if (@content.type_ == "status")    
                @comment.desc = @comment.type_= 'statustag'
              end    
              @comment.profile_id = current_user.profile.id
              @comment.postedagainst = profile
              @comment.save
            end
          end
        end
        format.html { redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully created.') }
        #format.xml  { render :xml => @content, :status => :created, :location => @content }
      else
        #        format.html { render :action => "new" }
        #        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
        #         flash.error(@content.errors)
        format.html { redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Error occured due to invalid link ' ) }
      end
      format.html { redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully created.') }
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    #  return render :json => params[:content]
    @content = Content.find(params[:id])
   
    respond_to do |format|
      if @content.update_attributes(params[:content])
        if (@content.type_ == "photo")
          if params[:from] == "webcam_picture"
            @cphoto = Cphoto.new
            @cphoto.content_id = params[:content_id]
            @cphoto.title = params[:title]
            @cphoto.photo = File.new(upload_path)
            @cphoto.save
          end
        elsif (@content.type_ == "question")
          @profile_ids = Profile.where(:user_id => params[:friend_ids]).map(&:id)
          if !@profile_ids.blank?
            for profile in @profile_ids
              @cpshare = Cpshare.new
              @cpoll = @content.cpoll
              @cpshare.cpoll_id = @cpoll.id
              @cpshare.profile_id = profile
              @cpshare.isanswered = false
              @cpshare.save
            end
          end 
        end
        if params[:from] == "edit_album"
          format.html { redirect_to("#{ listalbum_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully updated.') }  
        else
          format.html { redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully updated.') }     
        end
     
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create_poll
    @content = Content.new(params[:content])
    if @content.save
      @profile_ids = Profile.where(:user_id => params[:friend_ids]).map(&:id)
      if !@profile_ids.blank?
        for profile in @profile_ids
          @cpshare = Cpshare.new
          @cpoll = @content.cpoll
          @cpshare.cpoll_id = @cpoll.id
          @cpshare.profile_id = profile
          @cpshare.isanswered = false
          @cpshare.save
        end
      end
      # For current user
      @cpshare = Cpshare.new
      @cpoll = @content.cpoll
      @cpshare.cpoll_id = @cpoll.id
      @cpshare.profile_id = current_user.profile.id
      @cpshare.isanswered = false
      @cpshare.save 
      #       redirect_to(@content, :notice => 'Content was successfully created.')
      redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully created.') 
    else
      @error = []
      @content.errors.full_messages.each do |msg|
        if !msg.blank?
          @error << "#{msg}"
        end
      end
      flash[:notice] = @error
      redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => @error) 
    end
  end
    
    
  def ccdoc
    @content = Content.new
    @content.cstatus = Cstatus.new
    
    
  end
  
  
  def cevent
    @content = Content.new
    @content.cevent = Cevent.new
    
  end
  
  
  def cadd
    @content = Content.new
    @content.cadd = Cadd.new
   
  end
  
  
  
  def shared_with
    @inccontent = Content.find(params[:newcontent])
    @inccontent.update_attributes(params[:content])
    @newcontent = @inccontent
    
    @profile_ids = Profile.where(:user_id => params[:friend_ids]).map(&:id)
    if !@profile_ids.blank?
      for profile in @profile_ids
          
        if(@newcontent.type_ == "video")
          @newcontent = @newcontent.clone :include => :cvideo
            
        elsif(@newcontent.type_ == "link")
          @newcontent = @newcontent.clone :include => :clink
            
        elsif(@newcontent.type_ == "status")
          @newcontent = @newcontent.clone :include => :cstatus
            
        elsif(@newcontent.type_ == "poll")
          @newcontent = @newcontent.clone :include => :cpoll
          
        end 
        
        if(@newcontent.type_ == "poll" || @newcontent.type_ == "status" || @newcontent.type_ == "link" || @newcontent.type_ == "video"  )
          @newcontent.profile_id = profile
          @newcontent.poster_id = current_user.profile.id
          @newcontent.cposted_sharedwithflag='f'
          @newcontent.save      
          # system("ln -sf  /home/zaeem/work/sociobook/public/system/videos/"+ Content.find(params[:newcontent]).cvideo.id.to_s+" /home/zaeem/work/sociobook/public/system/videos/"+@newcontent.cvideo.id.to_s)
          system("ln -sf #{VIDEO_FILE_PATH}/#{Content.find(params[:newcontent]).cvideo.id} #{VIDEO_FILE_PATH}/#{@newcontent.cvideo.id}")
        end
            
        if(@newcontent.type_ == "photo" || @newcontent.type_ == "default" || @newcontent.type_ == "" )
          @newcontent = @newcontent.clone
                      
          @newcontent.profile_id = profile
          @newcontent.poster_id = current_user.profile.id
          @newcontent.cposted_sharedwithflag='f'
          @newcontent.save      
          
          @inccontent.cphotos.each do |p|
            new_photo = p.clone
            new_photo.content_id = @newcontent.id
            new_photo.save
            # system("ln -sf  /home/zaeem/work/sociobook/public/system/photos/"+ p.id.to_s+" /home/zaeem/work/sociobook/public/system/photos/"+new_photo.id.to_s)
            system("ln -sf #{PHOTO_FILE_PATH}/#{p.id} #{PHOTO_FILE_PATH}/#{new_photo.id}")
          end 
        end 
      end
    end
    redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully created.') 
    #    
    #    else
    #      @error = []
    #      @content.errors.full_messages.each do |msg|
    #        if !msg.blank?
    #          @error << "#{msg}"
    #        end
    #      end
    #      flash[:notice] = @error
    #      redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => @error) 
  end
  
  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    @content = Content.find(params[:id])
    if(@content.name == "default")
      Cphoto.find_all_by_content_id(@content.id).destroy
      @content.cphotos.destroy
    else
      @content.destroy
    end
    

    respond_to do |format|
      return redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully destroyed.') 
      #     redirect_to("#{ ewall_contents_path()}?#{params[:return_address]}", :notice => 'Content was successfully destroyed.') 
      format.xml  { head :ok }
    end
  end

  def take_picture # is used in upload webcam pic
    File.open(upload_path, 'w') do |f|
      f.write request.raw_post.force_encoding("UTF-8")
    end
    render :text => "ok"
  end

  private
  def upload_path # is used in upload webcam pic
    file_name = session[:session_id].to_s + '.jpg'
    File.join(Rails.root.to_s, 'public', 'uploads', file_name)
  end
  
end
