class EmployeesController < ApplicationController
  include Suitable

  before_action :find_employee, only: [:show, :edit, :update, :destroy]
  before_action :new_employee, only: [:new, :create]

  add_breadcrumb 'Работники', :employees_path

  def index
    @employees = Employee.paginate( page: params[:page], per_page: 10 )
  end

  def new
    add_breadcrumb 'Добавление работника', :new_employee_path

    respond_to do |format|
      format.html
      format.json { render json: @employee }
    end
  end

  def create
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Работник успешно создан." }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    add_breadcrumb 'Просмотр работника', :employee_path
    @fully_suitable = fully_suitable_vacancies @employee.skill_list
    @suitable = suitable_vacancies @employee.skill_list

    respond_to do |format|
      format.html
      format.json { render json: @employee }
    end
  end

  def edit
    add_breadcrumb 'Редактирование работника', :edit_employee_path

    respond_to do |format|
      format.html
      format.json { render json: @employ }
    end
  end

  def update
    respond_to do |format|
      if @employee.update_attributes(employee_params)
        format.html { redirect_to @employee, notice: "Работник успешно обновлен." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Работник успешно удален." }
      format.json { head :no_content }
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :status, :contacts, :salary, :skill_list) if params[:employee]
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def new_employee
      @employee = Employee.new( employee_params )
    end
end
