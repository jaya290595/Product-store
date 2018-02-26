class User < ApplicationRecord
  has_many :books
  has_many :reviews
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now	

  end
end
