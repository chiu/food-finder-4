class SessionsController < ApplicationController

    def new
    end

    def create
        diner = Diner.find_by(email: params[:email])

        if diner && diner.authenticate(params[:password])
            session[:diner_id] = diner.id
            redirect_to diners_path, notice: "Welcome back, #{diner.name}!"
        else
            flash.now[:alert] = "Log in failed..."
            render :new
        end
    end

end