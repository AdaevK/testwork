class Employee < ActiveRecord::Base
  STATUS = %w(looking not_looking)

  include Skillable
  include Salaryable

  validates :name, presence: true, russian_fio: true
  validates :contacts, presence: true, contacts: true
  validates :status, inclusion: { in: STATUS, message: "неверный статус" }

  default_scope { order('salary ASC') }
  scope :looking, -> { where( status: 'looking' ) }
end
