# Preview all emails at http://localhost:3000/rails/mailers/birthday_mailer
class BirthdayMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/birthday_mailer/notify
  def notify
    BirthdayMailer.notify
  end

end
