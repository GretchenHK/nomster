class NotificationMailer < ActionMailer::Base
  default from: "no-reply@brewsterapp.com"

  def comment_added
  	mail(to: "g.halasikun@gmail.com", 
  		subject: "A comment has been added to your place")
  end
end
