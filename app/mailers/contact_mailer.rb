class ContactMailer < ApplicationMailer
  default from: ENV["WEB_EMAIL"]

  def send_email(email)
    mail to: email, subject: "Welcome", body: "Thank you for subscribing to us"
  end
end
