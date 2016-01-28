class PeopleController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :load_person, only: [:show, :edit, :update, :destroy]
  before_action :convert_birthday, only: [:create, :update]

  def index
    if params[:letter]
      @people = Person.by_letter(params[:letter]).order(:lastname).page(params[:page])
    else
      @people = Kaminari.paginate_array(Person.all.birthday_order)
                        .page(params[:page]).per(20)
    end
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
    @person.birthday = RussianDate::date_to_rus(@person.birthday)
    @person.email = @person.email.sub('@svarbi.ru', '')
  end

  def update
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    if @person.destroy
      redirect_to people_path
      flash[:notice] = 'Сотрудник успешно удалён!'
    end
  end


  private

  def load_person
    @person = Person.find(params[:id])
    authorize @person
  end

  def person_params
    params.require(:person).permit(:name, :lastname, :email, :phone, :birthday, :avatar)
  end

  def convert_birthday
    params[:person][:birthday] = RussianDate.rus_to_date(params[:person][:birthday])
  end
end
