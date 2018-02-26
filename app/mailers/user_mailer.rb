class UserMailer < ApplicationMailer
	default from: "jagritipandey1995@gmail.com"

	def welcome_email(user)
	   @user = user

	   mail(to: @user.email, subject: 'Welcome to Product Store')
	 end	
end
