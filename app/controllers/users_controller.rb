class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if verify_recaptcha(:model => @user, :message => "Oh! It's error with CAPTCHA!")
      if @user.save
        @user.profile.birthdate = @user.birth_date
        @user.profile.save!
        UserSession.create!(@user)
        return redirect_to new_friends_url
      else
        @errors = []
        @user.errors.full_messages.each do |msg|
          @errors << "#{msg}" unless msg.blank?
        end
        flash[:error] = @errors
        return render :action => "new"
      end
    else
      @errors = []
      @user.errors.full_messages.each do |msg|
        @errors << "#{msg}" unless msg.blank?
      end
      flash[:error] = @errors
      return render :action => "new"
    end
  end

  def remove_picture
    current_user.avatar_file_name = nil
    current_user.avatar.destroy
    current_user.save(false)
    return redirect_to params[:return_path]
  end
  def recover
    @user = User.new
  end
  end
  
