class Vacancy < ActiveRecord::Base

  include Skillable
  include Salaryable

  validates :name, presence: true
  validates :validity, presence: true, dateality: { greater_than: :created_at }

  default_scope { order('salary DESC') }
  scope :active, -> { where('validity >= ?', Date.today ) }
end
