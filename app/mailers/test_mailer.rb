class TestMailer < ApplicationMailer
  def test_email
    mail(to: [ "nmondollot@gmail.com" ], subject: "Test")
  end
end
