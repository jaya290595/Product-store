class NotifyMailer < ApplicationMailer
  default from: "jagritipandey1995@gmail.com"

  def notify_email(user , product)
  	@product= product
    @user = user
    mail(to: @user.email, subject: 'Product is available now')
  end
end
