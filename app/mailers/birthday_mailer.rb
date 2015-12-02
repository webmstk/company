class BirthdayMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.birthday_mailer.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail(to: "to@example.org", template_path: 'mails', template_name: 'birthday_mailer/notify')
  end
end
