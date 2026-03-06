class OtpMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.otp_mailer.otp_mail.subject
  #
  def otp_mail
    @user = params[:user] 
    @otp = params[:otp]
    mail(to: @user.email, subject: "OTP verification")
  end

  def ticket_mail
    @user = params[:user]
    @event = params[:event]
    @booking = params[:booking]

    mail(to: @user.email, subject: "Your event ticket")
  end
end
