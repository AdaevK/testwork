RSpec.shared_examples 'salary' do

  it{ should have_db_column(:salary).of_type(:integer) }

  it{ should validate_numericality_of(:salary).is_greater_than(0) }
end
