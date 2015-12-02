class Person < ActiveRecord::Base
  validates :name,
            presence: true,
            length: {in: 2..20},
            format: {with: /\A[А-Яа-яёЁ]+\z/}

  validates :lastname,
            presence: true,
            length: {in: 2..20},
            format: {with: /\A[А-Яа-яёЁ]+\z/}

  validates :email,
            format: {with: /.+@.+\..+/i},
            allow_blank: true

  validates :phone,
            length: {is: 3},
            numericality: {only_integer: true, allow_nil: true},
            allow_blank: true

  before_validation :complete_email
  before_validation :downcase_email
  before_validation :capitalize_name


  def full_name
    [name, lastname].join(' ')
  end


  private

  def complete_email
    unless self.email.blank?
      self.email << '@svarbi.ru' unless self.email.include? '@'
    end
  end

  def downcase_email
    self.email.downcase! unless self.email.blank?
  end

  def capitalize_name
    self.name = self.name.mb_chars.capitalize unless self.name.blank?
    self.lastname = self.lastname.mb_chars.capitalize unless self.lastname.blank?
  end
end
