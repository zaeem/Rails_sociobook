class Notifier < ActionMailer::Base  
  default_url_options[:host] = "localhost:3000"  
  
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "dssd@gmail.com"  
    recipients    user.email  
    sent_on       Time.now  
    @link = edit_password_reset_url(user.perishable_token)  
  end  

  def add_friend_request_mail(sender_name ,reciever_name , user)
    subject       "DSSDSocio::Friend Added Accepted"
    from          "dssd@gmail.com"
    recipients    'mak000@gmail.com'
    sent_on       Time.now
    @sender_name = sender_name
    @reciever_name = reciever_name
  end
  def friendship_request_mail(sender_name,reciever_name,user)
    subject       "DSSDSocio::Friend Request"
    from          "dssd@gmail.com"
    recipients    'mak000@gmail.com'
    sent_on       Time.now
    @sender_name = sender_name
    @reciever_name = reciever_name
  end
  def reject_friend_request_mail(sender_name,reciever_name , user)
    subject       "DSSDSocio::Friend Rejected"
    from          "dssd@gmail.com"
    recipients    'mak000@gmail.com'
    sent_on       Time.now
    @sender_name = sender_name
    @reciever_name = reciever_name
  end
end
