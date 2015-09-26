

class DealsController < ApplicationController

    def new
        @diner = Diner.find(params[:diner_id])
        @deal = @diner.deals.build
    end

    def create
        @diner = Diner.find(params[:diner_id])
        @deal = @diner.deals.build(deal_params) # @deal.user_id = current_user.id

        if @deal.save
            redirect_to @diner, notice: "Review created successfully"
        else
            render :new
        end
    end

    protected

    def deal_params
        params.require(:deal).permit(:name)
    end

end