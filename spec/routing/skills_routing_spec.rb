require 'rails_helper'

RSpec.describe 'routes for Skills' do
  it{ expect(get('/skills/list')).to route_to( action: 'list', controller: 'skills' ) }
end
