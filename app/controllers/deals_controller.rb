

class DealsController < ApplicationController

    def new
        @diner = Diner.find(params[:diner_id])
        @deal = @diner.deals.build
    end

    def display_api
        @deals = Deal.all
        render json: @deals
    end



    def create
        @diner = Diner.find(params[:diner_id])
        @deal = @diner.deals.build(deal_params) # @deal.user_id = current_user.id

        if @deal.save
            redirect_to diners_path, notice: "Review created successfully"
            # redirect_to @diner, notice: "Review created successfully"
        else
            render :new
        end
    end

    protected

    def deal_params
        params.require(:deal).permit(:name, :old_price, :new_price, :offer_start, :offer_end, :pickup_start, :pickup_end, :description)
    end

end