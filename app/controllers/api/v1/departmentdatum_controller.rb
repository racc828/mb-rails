class Api::V1::DepartmentdatumController < ApplicationController

  def index
    # events = Event.all
    # render json: events
  end

  def create
    data = Departmentdatum.create(departmentdatum_params)
    current_user.departmentdatum << data
    render json: data
  end

  def get_department_data
    dep = Departmentdatum.all.select do |data|
      data.department == params[:department]
    end
    render json: dep
  end


  private

  def departmentdatum_params
    params.require(:departmentdatum).permit(:description, :user_id, :department)
  end

end
