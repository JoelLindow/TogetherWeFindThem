class MissingPersonsController < ApplicationController
  def index
    @missing_persons = MissingPerson.all
  end

  def show
    
  end

end
