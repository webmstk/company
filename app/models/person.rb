class Person < ActiveRecord::Base
  validates :name,
            presence: true,
            length: { in: 2..20 },
            format: { with: /\A[А-Яа-яёЁ]+\z/ }

  validates :lastname,
            presence: true,
            length: { in: 2..20 },
            format: { with: /\A[А-Яа-яёЁ]+\z/ }

  validates :email,
            format: { with: /.+@.+\..+/i },
            allow_blank: true

  validates :phone,
            length: { is: 3 },
            numericality: { only_integer: true, allow_nil: true },
            allow_blank: true

  def full_name
    [name, lastname].join(' ')
  end
end
