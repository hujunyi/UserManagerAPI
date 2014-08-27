class UsersController < ApplicationController
  before_action :set_user, only: [:update,:show]
  def index
    render json: User.all
  end
   
  def new
    @user = User.new
    render json: @user
  end
   
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else  
      render json: @user.errors, status: :unprocessible_entity
    end
  end

  def update
    if @user.update(user_params)
      head :no_content
    else 
      render json: @user.errors, status: :unprocessible_entity
    end
  end

  def show
    render json: @user
  end

  private 
  def user_params
    params.permit(:firstname,:lastname,:age,:id)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
