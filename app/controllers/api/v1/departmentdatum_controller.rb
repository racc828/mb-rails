class Api::V1::DepartmentdatumController < ApplicationController

  # def index
  #   events = Event.all
  #   render json: events
  # end

  def create
    data = Departmentdata.create(departmentdatum_params)
    current_user.departmentdatum << data
    render json: event
  end


  private

  def departmentdatum_params
    params.require(:departmentdata).permit(:description)
  end

end
