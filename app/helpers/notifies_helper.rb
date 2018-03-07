module NotifiesHelper

  def notify_mailer(users,prod_id)
    @product = Product.find_by(id: prod_id)
    users.each do|user|
      @user = User.find_by(id: user.user_id)
      NotifyMailer.notify_email(@user, @product).deliver_now 
    end
  end



end
