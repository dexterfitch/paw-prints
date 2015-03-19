class PrintsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    if @user != current_user
      flash[:notice] = "Not your page, buster!"
      redirect_to users_path
    end
    @print = Print.new
  end

  def create
    @user = User.find(params[:user_id])
    @print = @user.prints.new(print_params)
    if @print.save
      flash[:notice] = "Print added!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Your print slipped through our paws... Please try again."
      render :new
    end
  end

private
  def print_params
    params.require(:print).permit(:image)
  end
end
