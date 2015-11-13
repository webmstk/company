class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :lastname, presence: true

  def full_name
    [name, lastname].join(' ')
  end
end
