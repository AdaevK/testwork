require 'rails_helper'

RSpec.describe SkillsController, :type => :controller do

  context "GET list" do
    before :each do
      FactoryGirl.create( :employee_ruby, skill_list: 'ruby, node.js' )
      @result = [{"id" => vacancy.skill_list[0], "text" => vacancy.skill_list[0] }]
      get :list, format: :json, q: 'r'
    end
    let(:vacancy) { FactoryGirl.create( :vacancy_ruby ) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response.header['Content-Type']).to include 'application/json' }
    it{ expect(JSON.parse(response.body)).to eq @result }
  end
end
