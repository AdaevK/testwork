RSpec.shared_examples 'skillable' do
  let(:object_sym){ described_class.name.underscore.to_sym }

  context 'skill list' do
    let(:object){ FactoryGirl.create( object_sym ) }

    it{ expect(object.skill_list).not_to be_nil }
    it{ expect(object.skill_list).not_to be_empty }
  end

  context 'class methods' do
    before :each do
      @ruby      = FactoryGirl.create( object_sym, skill_list: 'ruby' )
      @ruby_node = FactoryGirl.create( object_sym, skill_list: 'ruby, node.js' )
      @ror_ang   = FactoryGirl.create( object_sym, skill_list: 'ruby on rails, angularjs' )
    end

    it{ expect( described_class.find_skills_match_all(['ruby', 'node.js']).flatten ).to eq [@ruby_node] }
    it{ expect( described_class.find_skills_any(['ruby']).flatten ).to match_array [@ruby, @ruby_node] }
  end
end
