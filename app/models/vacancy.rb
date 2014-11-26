class Vacancy < ActiveRecord::Base
  validates :name, presence: true
  validates :validity, presence: true, dateality: { greater_than: :created_at }
  validates :salary, numericality: { greater_than: 0 }
end
