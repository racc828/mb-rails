class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.find_by(username: params[:user][:email])
    if user.present?
      render json: {
        error: "User Exists Already"
      }, status: 404
    else
      newUser = User.create(user_params)
      render json: {
        id: newUser.id,
        firstname: newUser.firstname,
        email: newUser.email,
        admin: newUser.admin,
        jwt: JWT.encode({id: newUser.id}, "mbrails")
      }
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :email, :password, :admin)
  end

end
