class SellPointOffersController < AdminController
  before_action :set_sell_point_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_sell_point, except: [:destroy, :show]

  def index
    @offers = @sell_point.sell_point_offers
  end

  def show
  end

  def new
    @offer = SellPointOffer.new(sell_point_id: params[:sell_point_id])
  end

  def edit
    @offer.sell_point = @sell_point
  end

  def create
    @offer = SellPointOffer.new(sell_point_offer_params)
    @offer.sell_point_id = @sell_point.id
      if @offer.save
        flash[:success] = 'Sell point offer was successfully created.'
        redirect_to sell_point_offers_path(sell_point_id: @offer.sell_point_id)
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render action: 'new' 
      end
  end

  def update
      if @offer.update(sell_point_offer_params)
        flash[:success] = 'Sell point offer was successfully updated.'
        redirect_to sell_point_offers_path(sell_point_id: @offer.sell_point_id)
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render action: 'edit' 
      end
  end

  def destroy
    @offer.destroy
    flash[:success] = 'Sell point offer was successfully deleted.'
    redirect_to sell_point_offers_path(sell_point_id: @offer.sell_point_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_point_offer
      @offer = SellPointOffer.find(params[:id])
    end

    def set_sell_point
      @sell_point = SellPoint.find(params[:sell_point_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_point_offer_params
      params.require(:sell_point_offer).permit(:offer_id, :start_date, :end_date, :price)
    end
end
