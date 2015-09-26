class DinersController < ApplicationController
  def new
  end

  def create
  end
end


 class DinersController < ApplicationController

      def new
        @diner = Diner.new
      end

      def create
        @diner = Diner.new(diner_params)

        if @diner.save
          # redirect_to movies_path
        else
          render :new
        end
      end

      protected

      def diner_params
        params.require(:diner).permit(:email, :firstname, :lastname, :password, :password_confirmation)
      end

    end