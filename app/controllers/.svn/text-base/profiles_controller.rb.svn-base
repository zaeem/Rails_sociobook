class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.xml  
  autocomplete :profile, :contact_currentcity
  autocomplete :profile, :contact_town
  autocomplete :profile, :languages

  before_filter :require_user
  
  
  def index
    @profiles = Profile.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])
    return redirect_to eprofile_home_url(@sk, :sk => "basic")
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end
  #  @project = Project.new
  # 3.times { @project.tasks.build }

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
    
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new_view
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profile_universities/1/edit
  def edit
    @profile = Profile.find(params[:id])

  end

  def create
    @profile = Profile.new(params[:profile])
       #return render :json => ["UPDATE", params]
    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
#      return render :json => params[:profile]
    @profile = Profile.find(params[:id])
    
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        @type = params[:return_type]
        @error = []
       
        if @type == 'basic'
          format.html {redirect_to(eprofile_home_path(:sk => "basic"), :notice => @profile.errors.full_messages)}
        
        elsif @type == 'relationships'
          @profile.profile_relations.each do |relation|
            next if relation.valid?
            relation.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "relationships"), :notice => @error)}
        
        elsif @type == 'philosophy'
          @profile.profile_ppl_inspirations.each do |inspiration|
            next if inspiration.valid?
            inspiration.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "philosophy"), :notice => @error)}
        
        elsif @type == 'eduwork'
          @profile.profile_employers.each do |employer|
            next if employer.valid?
            employer.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_universities.each do |university|
            next if university.valid?
            university.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "eduwork"), :notice => @error)}

        elsif @type == 'entertainment'
          @profile.profile_books.each do |book|
            next if book.valid?
            book.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_games.each do |game|
            next if game.valid?
            game.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_musics.each do |music|
            next if music.valid?
            music.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_movies.each do |movie|
            next if movie.valid?
            movie.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "entertainment"), :notice => @error)}
        
        elsif @type == 'sports'
          @profile.profile_play_sports.each do |sport|
            next if sport.valid?
            sport.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_player_sports.each do |player|
            next if player.valid?
            player.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_team_sports.each do |team|
            next if team.valid?
            team.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "sports"), :notice => @error)}
          
        elsif @type == 'activities'
          @profile.profile_activities.each do |activity|
            next if activity.valid?
            activity.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.profile_interests.each do |interest|
            next if interest.valid?
            interest.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          format.html {redirect_to(eprofile_home_path(:sk => "activities"), :notice => @error)}
          
        elsif @type == 'contact'
          @profile.pemails.each do |mail|
            next if mail.valid?
            mail.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.pneighbours.each do |neighbour|
            next if neighbour.valid?
            neighbour.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.pwebsites.each do |website|
            next if website.valid?
            website.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.pscreens.each do |screen|
            next if screen.valid?
            screen.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          @profile.pemails.each do |mail|
            next if mail.valid?
            mail.errors.full_messages.each do |msg|
              @error << "#{msg}" unless msg.blank?
            end
          end
          
          
          
          format.html {redirect_to(eprofile_home_path(:sk => "contact"), :notice => @error)}
        else
          format.html { render :action => "edit" }
        end
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
end