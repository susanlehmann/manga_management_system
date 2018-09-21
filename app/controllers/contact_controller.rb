class ContactController < ApplicationController
  def send_email
    ContactMailer.send_email(params[:email]).deliver_now
    redirect_to root_url
  end
end
