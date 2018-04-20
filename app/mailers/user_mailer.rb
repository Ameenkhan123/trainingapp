class UserMailer < ApplicationMailer
	  default from: 'notifications@example.com'
 
  def welcome_email(user)

    @user = user
    @url  = 'http://example.com/login'
    attachments.inline['admin-icon.png'] = File.read(Rails.root.join("app/assets/images/admin-icon.png"))
    mail(to: @user.email, subject: 'Status updation App')

  end

  def notify_to_all_user_about_new_course(course, user)
  	@course = course
  	@user = user
    @url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Status updation App')
  end

end
