class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: {with: /.+@.+\..+/i}
  validates :email, uniqueness: true


  def self.notify_all
    all.each do |subscriber|
      subscriber.notify
    end
  end

  def notify
    BirthdayMailer.notify(self).deliver_now
  end
end
