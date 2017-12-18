class Api::V1::SessionsController < ApplicationController

  before_action :authorize_user!, only: [:show]

  def show
    render json: {
      id: current_user.id,
      firstname: current_user.firstname,
      email: current_user.email,
      admin: current_user.admin
    }
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      render json: {
        id: user.id,
        firstname: user.firstname,
        email: user.email,
        admin: user.admin,
        jwt: JWT.encode({id: user.id}, "mbrails")
      }
    else
      render json: {
        error: "Please login with the correct credentials!"
      }, status: 404
    end
  end

end
