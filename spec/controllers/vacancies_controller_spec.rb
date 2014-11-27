require 'rails_helper'

RSpec.describe VacanciesController, :type => :controller do

  context "GET index" do
    before :each do
      get :index
    end
    let(:vacancy){ FactoryGirl.create( :vacancy ) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :index }
    it{ expect(assigns(:vacancies)).to eq([vacancy]) }
  end

  context "GET new" do
    before :each do
      get :new
    end

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :new }
  end

  context "POST create" do
    context "with valid attribute" do
      let(:vacancy){ FactoryGirl.attributes_for :vacancy }

      it{ expect{ post :create, vacancy: vacancy }.to change(Vacancy, :count).by(1) }
      it "redirects to the new contact" do
        post :create, vacancy: vacancy
        expect(response).to redirect_to Vacancy.last
      end
    end

    context "with invalid attribute" do
      let(:vacancy){ FactoryGirl.attributes_for :vacancy, name: nil }

      it{ expect{ post :create, vacancy: vacancy }.to_not change(Vacancy, :count) }

      it "re-renders the new method" do
        post :create, vacancy: vacancy
        expect(response).to render_template :new
      end
    end
  end

  context "GET show" do
    before :each do
      get :show, id: vacancy
    end
    let(:vacancy){ FactoryGirl.create(:vacancy) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :show }
    it{ expect(assigns(:vacancy)).to eq(vacancy) }
  end

  context "GET edit" do
    before :each do
      get :edit, id: vacancy
    end
    let(:vacancy){ FactoryGirl.create(:vacancy) }

    it{ expect(response).to have_http_status(:success) }
    it{ expect(response).to render_template :edit }
  end

  context "PATCH update" do

    context "with valid attribute" do
      before :each do
        @new_name = "Test Name Vacancy"
        patch :update, id: vacancy.id, vacancy: FactoryGirl.attributes_for(:vacancy, name: @new_name)
      end
      let(:vacancy){ FactoryGirl.create(:vacancy) }

      it{ expect(assigns(:vacancy)).to eq(vacancy) }
      it{ expect(response).to redirect_to vacancy }
      it{ expect(vacancy.reload.name).to eq(@new_name) }
    end

    context "with invalid attribute" do
      before :each do
        @new_validity = Date.today.prev_day
        patch :update, id: vacancy.id, vacancy: FactoryGirl.attributes_for(:vacancy, validity: @new_validity)
      end
      let(:vacancy){ FactoryGirl.create(:vacancy) }

      it{ expect(assigns(:vacancy)).to eq(vacancy) }
      it{ expect(response).to render_template :edit }
      it{ expect(vacancy.reload.validity).to_not eq(@new_validity) }
    end
  end

  context "DELETE destroy" do
    let(:vacancy){ FactoryGirl.create(:vacancy) }

    it{ expect{ delete :destroy, id: vacancy }.to change(Vacancy, :count).by(0) }
    it "redirect to vacancies" do
      delete :destroy, id: vacancy
      expect(response).to redirect_to vacancies_url
    end
  end

end
