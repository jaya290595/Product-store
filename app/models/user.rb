class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :carts, dependent: :destroy
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now  
  end

  after_create :send_welcome_email
  def send_notify_email
    UserMailer.notify_mail(self).deliver_now
  end
end

