require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do

  context "GET index" do
    before :each do
      get :index
    end
    let(:employee){ FactoryGirl.create( :employee ) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :index }
    it{ expect(assigns(:employees)).to eq([employee]) }
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
      let(:employee){ FactoryGirl.attributes_for :employee }

      it{ expect{ post :create, employee: employee }.to change(Employee, :count).by(1) }
      it "redirects to the new contact" do
        post :create, employee: employee
        expect(response).to redirect_to Employee.last
      end
    end

    context "with invalid attribute" do
      let(:employee){ FactoryGirl.attributes_for :employee, name: nil }

      it{ expect{ post :create, employee: employee }.to_not change(Employee, :count) }

      it "re-renders the new method" do
        post :create, employee: employee
        expect(response).to render_template :new
      end
    end
  end

  context "GET show" do
    before :each do
      get :show, id: employee
    end
    let(:employee){ FactoryGirl.create(:employee) }

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :show }
    it{ expect(assigns(:employee)).to eq(employee) }

    it_behaves_like 'show_suitable', Employee
  end

  context "GET edit" do
    before :each do
      get :edit, id: employee
    end
    let(:employee){ FactoryGirl.create(:employee) }

    it{ expect(response).to have_http_status(:success) }
    it{ expect(response).to render_template :edit }
  end

  context "PATCH update" do

    context "with valid attribute" do
      before :each do
        @new_name = "Новое Имя Работника"
        patch :update, id: employee.id, employee: FactoryGirl.attributes_for(:employee, name: @new_name)
      end
      let(:employee){ FactoryGirl.create(:employee) }

      it{ expect(assigns(:employee)).to eq(employee) }
      it{ expect(response).to redirect_to employee }
      it{ expect(employee.reload.name).to eq(@new_name) }
    end

    context "with invalid attribute" do
      before :each do
        @new_contacts = "asdf@re"
        patch :update, id: employee.id, employee: FactoryGirl.attributes_for(:employee, contacts: @new_contacts)
      end
      let(:employee){ FactoryGirl.create(:employee) }

      it{ expect(assigns(:employee)).to eq(employee) }
      it{ expect(response).to render_template :edit }
      it{ expect(employee.reload.contacts).to_not eq(@new_contacts) }
    end
  end

  context "DELETE destroy" do
    let(:employee){ FactoryGirl.create(:employee) }

    it{ expect{ delete :destroy, id: employee }.to change(Employee, :count).by(0) }
    it "redirect to employees" do
      delete :destroy, id: employee
      expect(response).to redirect_to employees_url
    end
  end

end
