class PeopleController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :load_person, only: [:show, :edit, :update, :destroy]
  before_action :convert_birthday, only: [:create, :update]

  def index
    @people = Person.all.order(:lastname)
  end

  def show
  end

  def new
    @person = Person.new
    authorize @person
  end

  def create
    @person = Person.new(person_params)
    authorize @person

    if @person.save
      redirect_to people_path
      flash[:notice] = 'Сотрудник успешно создан!'
    else
      render :new
    end
  end

  def edit
    authorize @person
  end

  def update
    authorize @person

    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    authorize @person

    if @person.destroy
      redirect_to people_path
      flash[:notice] = 'Сотрудник успешно удалён!'
    end
  end


  private

  def load_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :lastname, :email, :phone, :birthday)
  end

  def convert_birthday
    params[:person][:birthday] = RussianDate.rus_to_date(params[:person][:birthday])
  end
end
