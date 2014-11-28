class Employee < ActiveRecord::Base
  STATUS = %w(looking not_looking)

  validates :name, presence: true, russian_fio: true
  validates :contacts, presence: true, contacts: true
  validates :status, inclusion: { in: STATUS, message: "неверный статус" }
  validates :salary, numericality: { greater_than: 0 }
end
