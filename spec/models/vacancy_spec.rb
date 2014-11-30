require 'rails_helper'

RSpec.describe Vacancy, :type => :model do
  it{ should have_db_column(:name).of_type(:string) }
  it{ should have_db_column(:validity).of_type(:date) }
  it{ should have_db_column(:contacts).of_type(:text) }

  it{ should validate_presence_of :name }
  it{ should validate_presence_of :validity }
  it{ should validate_dateality_of(:validity).greater_than(:created_at) }

  it_behaves_like 'salary'
  it_behaves_like 'skillable'

  context 'default scope' do
    it{ expect( Vacancy.default_scoped.order_values ).to eq [ 'salary DESC' ] }
  end

  context 'scope active' do
    it{ expect( Vacancy.active.to_sql ).to eq Vacancy.where('validity >= ?', Date.today).to_sql }
  end
end
