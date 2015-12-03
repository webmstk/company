namespace :birthday do
  desc 'рассылка уведомлений о ближайших днях рождениях'
  task send: :environment do
    BirthdayMailer.notify.deliver_now
  end
end

