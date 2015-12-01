class PeopleController < ApplicationController
  def index
    @people = Person.all.order(:lastname)
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    params[:person][:birthday] = RussianDate.rus_to_date(params[:person][:birthday])

    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
      flash[:notice] = 'Сотрудник успешно создан!'
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    params[:person][:birthday] = RussianDate.rus_to_date(params[:person][:birthday])
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    person = Person.find(params[:id])
    if person.destroy
      redirect_to people_path
      flash[:notice] = 'Сотрудник успешно удалён!'
    end
  end


  private

  def person_params
    params.require(:person).permit(:name, :lastname, :email, :phone, :birthday)
  end
end
