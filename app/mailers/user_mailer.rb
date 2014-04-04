class UserMailer < ActionMailer::Base
  default :from => 'wakko978@gmail.com', :to => 'wakko978@gmail.com'
  
  def notify_admin(text,profile)
    @text = text
    @profile = profile
    mail(:subject => "COPTER: Notification")
  end
end
