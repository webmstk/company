class BirthdayMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.birthday_mailer.notify.subject
  #
  def notify
    emails = %w(eta@svarbi.ru lubov@svarbi.ru)

    @persons = Person.birthday
    if @persons.any?
      emails.each do |email|
        mail(to: email, subject: 'СВАРБИ: дни рождения', template_path: 'mails', template_name: 'birthday_mailer/notify')
      end
    end
  end
end
