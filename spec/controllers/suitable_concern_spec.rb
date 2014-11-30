require 'rails_helper'

RSpec.describe 'Suitable Concern' do
  before do
    class FackesController < ApplicationController
      include Suitable
    end
  end
  subject{ FackesController.new }

  context 'Employee methods' do
    before :each do
      @ruby      = FactoryGirl.create( :employee, skill_list: 'ruby, ruby on rails' )
      @ruby_node = FactoryGirl.create( :employee, skill_list: 'ruby, node.js' )
      @ruby_ror   = FactoryGirl.create( :employee, skill_list: 'ruby, ruby on rails', status: 'not_looking' )
    end

    it{ expect(subject.fully_suitable_employees(['ruby', 'node.js']).flatten).to eq [@ruby_node] }
    it{ expect(subject.suitable_employees(['ruby', 'node.js']).flatten).to eq [@ruby] }
  end

  context 'Vacancy methods' do
    before :each do
      @ruby      = FactoryGirl.create( :vacancy, skill_list: 'ruby, ruby on rails' )
      @ruby_node = FactoryGirl.create( :vacancy, skill_list: 'ruby, node.js' )
      @ruby_ror   = FactoryGirl.build( :vacancy_inactive, skill_list: 'ruby, ruby on rails' )
      @ruby_ror.save(validate: false)
    end

    it{ expect(subject.fully_suitable_vacancies(['ruby', 'node.js']).flatten).to eq [@ruby_node] }
    it{ expect(subject.suitable_vacancies(['ruby', 'node.js']).flatten).to eq [@ruby] }
  end
end
