class MissingPeopleController < ApplicationController
  def index
    @missing_people = MissingPerson.all
  end

  def show
    @person = MissingPerson.find(params[:id])
  end

  def new
    @person = MissingPerson.new
  end

  def create
    @person = MissingPerson.new(missing_person_params)
    if @person.save
      flash[:message] = "Missing Person Profile has been created."
      redirect_to missing_person_path(@person)
    else
      flash[:message] = "Missing Person Profile not created"
      redirect_to new_missing_person_path
    end
  end

  private

  def missing_person_params
    params.require(:missing_person).permit(:first_name, :last_name, :age, :sex, :eye_color, :hair_color, :skin_color, :race, :other_phys_features, :last_seen_city, :last_seen_state, :last_seen_place, :last_seen_with, :other_information)
  end
end
