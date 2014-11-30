require "rails_helper"

RSpec.describe "routes for Vacancies" do
  it{ expect(get('/vacancies')).to route_to( action: "index", controller: "vacancies" ) }
  it{ expect(get('/vacancies/new')).to route_to( action: "new", controller: "vacancies" ) }
  it{ expect(post('/vacancies')).to route_to( action: "create", controller: "vacancies" ) }
  it{ expect(get('/vacancies/1')).to route_to( action: "show", controller: "vacancies", id: "1" ) }
  it{ expect(get('/vacancies/1/edit')).to route_to( action: "edit", controller: "vacancies", id: "1" ) }
  it{ expect(patch('/vacancies/1')).to route_to( action: "update", controller: "vacancies", id: "1" ) }
  it{ expect(delete('/vacancies/1')).to route_to( action: "destroy", controller: "vacancies", id: "1" ) }
end
