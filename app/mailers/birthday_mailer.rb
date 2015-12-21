class BirthdayMailer < ApplicationMailer
  default to: Proc.new { ['eta@svarbi.ru', 'etalord@yandex.ru'] },
          from: 'site@svarbi.ru'

  def notify
    @persons = Person.birthday
    if @persons.any?
        mail(to: 'eta@svarbi.ru',
             subject: 'СВАРБИ: дни рождения',
             template_path: 'mails',
             template_name: 'birthday_mailer/notify')
    end
  end
end