class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail
    @greeting = "Hi"
    @contact = contact
    mail to: ENV['tisiphone0124@gmail.com'], subject: "メールのタイトル"
  end
end
