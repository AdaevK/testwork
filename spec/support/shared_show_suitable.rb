RSpec.shared_examples 'show_suitable' do |klass|
  let(:object){ FactoryGirl.create( klass.name.underscore.to_sym ) }

  before :each do
    get :show, id: object
  end

  it{ expect(assigns(:fully_suitable)).not_to be_nil }
  it{ expect(assigns(:suitable)).not_to be_nil }
end
