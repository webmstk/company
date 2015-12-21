class BirthdayMailer < ApplicationMailer
  def notify
    @persons = Person.birthday
    if @persons.any?
        mail(to: ['eta@svarbi.ru', 'lubov@svarbi.ru'],
             subject: 'СВАРБИ: дни рождения',
             template_path: 'mails',
             template_name: 'birthday_mailer/notify')
    end
  end
end