# Preview all emails at http://localhost:3000/rails/mailers/otp_mailer
class OtpMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/otp_mailer/otp_mail
  def otp_mail
    OtpMailer.otp_mail
  end
end
