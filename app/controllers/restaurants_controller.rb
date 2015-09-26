class RestaurantsController < ApplicationController



    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to movies_path
        else
            render :new
        end
    end

    def update
        @restaurant = Restaurant.find(params[:id])

        if @restaurant.update_attributes(restaurant_params)
            redirect_to movie_path(@restaurant)
        else
            render :edit
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to movies_path
    end

    protected

    def restaurant_params
        params.require(:restaurant).permit(
            :name, :location, :rating, :description
            )
    end

end
