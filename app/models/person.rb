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

  validates :birthday_sort,
            presence: true, unless: 'birthday.nil?'


  before_validation :complete_email
  before_validation :downcase_email
  before_validation :capitalize_name
  before_validation :fill_birthday_sort


  scope :birthday, -> do
    from = Date.today.strftime('%m%d')
    to = 15.days.from_now.strftime('%m%d')
    if from > to # begin of the year
      where('(birthday_sort >= ? AND birthday_sort <= ?) OR (birthday_sort >= ? AND birthday_sort <= ?)', from, '1231', '0101', to)
    else
      where(birthday_sort: from..to)
    end
  end


  def self.birthday_order
    now = Time.now.strftime("%m%d").to_i

    all.sort_by do |person|
      if person.birthday_sort.to_i < now
        (person.birthday_sort.nil?) ? 2500 : person.birthday_sort.to_i + 1231
      else
        person.birthday_sort
      end
    end
  end


  def full_name
    [lastname, name].join(' ')
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

  def fill_birthday_sort
    self.birthday_sort = self.birthday.strftime("%m%d") unless self.birthday.nil?
  end

  def self.by_letter(letter)
    where('lastname LIKE ?', "#{letter}%")
  end
end
