


class DinersController < ApplicationController

  def new
    @diner = Diner.new
  end

  def index
    @diners = Diner.all
  end

  def create
    @diner = Diner.new(diner_params)

    if @diner.save
      session[:diner_id] = @diner.id
      redirect_to diners_path, notice: "Welcome aboard, #{@diner.email}!"
    else
      render :new
    end
  end

  protected

  def diner_params
    params.require(:diner).permit(:email, :name, :password, :password_confirmation, :location, :description, :rating)
  end

end