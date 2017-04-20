class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/cats'
    mail(to: user.username, subject: 'Welcome to the 99 Cats website')
  end
end
