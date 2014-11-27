class VacanciesController < ApplicationController
  before_action :find_vacancy, only: [:show, :edit, :update, :destroy]
  before_action :new_vacancy, only: [:new, :create]

  def index
    @vacancies = Vacancy.all
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @vacancy }
    end
  end

  def create
    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: "Вакансия успешно создана." }
        format.json { render json: @vacancy, status: :created, location: @vacancy }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @vacancy }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @vacancy }
    end
  end

  def update
    respond_to do |format|
      if @vacancy.update_attributes(vacancy_params)
        format.html { redirect_to @vacancy, notice: "Вакансия успешно обновлена." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vacancy.destroy

    respond_to do |format|
      format.html { redirect_to vacancies_url, notice: "Вакансия успешно удалена." }
      format.json { head :no_content }
    end
  end

  private

    def vacancy_params
      params.require(:vacancy).permit(:name, :validity, :salary, :contacts ) if params[:vacancy]
    end

    def find_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def new_vacancy
      @vacancy = Vacancy.new( vacancy_params )
    end
end
