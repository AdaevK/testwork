require 'rails_helper'

RSpec.describe Vacancy, :type => :model do
  it{ should have_db_column(:name).of_type(:string) }
  it{ should have_db_column(:validity).of_type(:date) }
  it{ should have_db_column(:salary).of_type(:integer) }
  it{ should have_db_column(:contacts).of_type(:text) }

  it{ should validate_presence_of :name }
  it{ should validate_presence_of :validity }
  it{ should validate_dateality_of(:validity).greater_than(:created_at) }
  it{ should validate_numericality_of(:salary).is_greater_than(0) }
end
