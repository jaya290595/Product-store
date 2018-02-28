class NotifyMailer < ApplicationMailer
  default from: "jagritipandey1995@gmail.com"

  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Product is available now')
  end
end
