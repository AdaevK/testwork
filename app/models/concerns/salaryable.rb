module Salaryable
  extend ActiveSupport::Concern

  included do
    validates :salary, numericality: { greater_than: 0 }
  end
end
