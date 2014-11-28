require 'rails_helper'

RSpec.describe Employee, :type => :model do
  it{ should have_db_column(:name).of_type(:string) }
  it{ should have_db_column(:contacts).of_type(:string) }
  it{ should have_db_column(:status).of_type(:string) }
  it{ should have_db_column(:salary).of_type(:integer) }

  it{ should validate_presence_of :name }
  it{ should validate_russian_fio_of :name }
  it{ should validate_presence_of :contacts }
  it{ should validate_contacts_of :contacts }
  it{ should validate_inclusion_of(:status).in_array(Employee::STATUS).with_message("неверный статус") }
  it{ should validate_numericality_of(:salary).is_greater_than(0) }

  context 'default scope' do
    it{ expect( Employee.default_scoped.order_values ).to eq [ 'salary ASC' ] }
  end

  context 'scope looking' do
    it{ expect( Employee.looking.where_values_hash ).to eq "status" => "looking" }
  end
end
