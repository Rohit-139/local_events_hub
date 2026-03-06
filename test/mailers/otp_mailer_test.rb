require "test_helper"

class OtpMailerTest < ActionMailer::TestCase
  test "otp_mail" do
    mail = OtpMailer.otp_mail
    assert_equal "Otp mail", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
