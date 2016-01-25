namespace :birthday do
  desc 'рассылка уведомлений о ближайших днях рождениях'
  task send: :environment do
    Subscriber::notify_all
  end
end

