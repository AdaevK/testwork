class Employee < ActiveRecord::Base
  STATUS = %w(looking not_looking)

  include Skillable

  validates :name, presence: true, russian_fio: true
  validates :contacts, presence: true, contacts: true
  validates :status, inclusion: { in: STATUS, message: "неверный статус" }
  validates :salary, numericality: { greater_than: 0 }

  default_scope { order('salary ASC') }
  scope :looking, -> { where( status: 'looking' ) }
end
