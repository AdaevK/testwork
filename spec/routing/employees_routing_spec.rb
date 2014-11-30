require "rails_helper"

RSpec.describe "routes for Employees" do
  it{ expect(get('/employees')).to route_to( action: 'index', controller: 'employees' ) }
  it{ expect(get('/employees/new')).to route_to( action: 'new', controller: 'employees' ) }
  it{ expect(post('/employees')).to route_to( action: 'create', controller: 'employees' ) }
  it{ expect(get('/employees/1')).to route_to( action: 'show', controller: 'employees', id: '1' ) }
  it{ expect(get('/employees/1/edit')).to route_to( action: 'edit', controller: 'employees', id: '1' ) }
  it{ expect(patch('/employees/1')).to route_to( action: 'update', controller: 'employees', id: '1' ) }
  it{ expect(delete('/employees/1')).to route_to( action: 'destroy', controller: 'employees', id: '1' ) }
end
