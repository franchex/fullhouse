class UserMailer < ApplicationMailer
  default from: 'fullhouseapp93@gmail.com'
  def welcome_email
    @user = params[:user]
    @space = params[:space]
    @url = "http://localhost:3000/spaces/#{@space.id}/assignments"
    mail(to: @user.email, subject: 'Welcome to Our New Space')
  end

end
