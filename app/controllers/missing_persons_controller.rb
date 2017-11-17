class MissingPersonsController < ApplicationController
  def index
    @missing_persons = MissingPerson.all
  end

  def show
    @person = MissingPerson.find(params[:id])
  end

end
