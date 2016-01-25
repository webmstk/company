class BirthdayMailer < ApplicationMailer
  def notify(subscriber)
    @persons = Person.birthday

    if @persons.any?
        mail(to: subscriber.email,
             subject: 'СВАРБИ: дни рождения',
             template_path: 'mails',
             template_name: 'birthday_mailer/notify')
    end
  end
end