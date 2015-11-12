class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :lastname, presence: true
end
