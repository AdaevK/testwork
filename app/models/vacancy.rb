class Vacancy < ActiveRecord::Base

  acts_as_taggable_on :skills

  validates :name, presence: true
  validates :validity, presence: true, dateality: { greater_than: :created_at }
  validates :salary, numericality: { greater_than: 0 }

  default_scope { order('salary DESC') }
  scope :active, -> { where('validity >= ?', Date.today ) }
end
