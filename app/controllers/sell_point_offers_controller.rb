class SellPointOffersController < AdminController
  before_action :set_sell_point_offer, only: [:show, :edit, :update, :destroy]

  def index
    @sell_point = SellPoint.find(params[:sell_point_id])
    @offers = @sell_point.sell_point_offers
  end

  def show
  end

  def new
    @sell_point = SellPoint.find(params[:sell_point_id])
    @offer = SellPointOffer.new(sell_point: @sell_point)
  end

  def edit
    @sell_point = SellPoint.find(params[:sell_point_id])
    @offer = SellPointOffer.find(params[:id])
    @offer.sell_point = @sell_point
  end

  def create
    @sell_point = SellPoint.find(params[:sell_point_id])
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
    @sell_point = SellPoint.find(params[:sell_point_id])
      if @offer.update(sell_point_offer_params)
        flash[:success] = 'Sell point offer was successfully updated.'
        redirect_to sell_point_offers_path(sell_point_id: @offer.sell_point_id)
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render action: 'edit' 
      end
  end

  def destroy
    @sell_point = SellPoint.find(params[:sell_point_id])
    @offer.destroy
    redirect_to sell_point_offers_path(sell_point_id: @offer.sell_point_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_point_offer
      @offer = SellPointOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_point_offer_params
      params.require(:sell_point_offer).permit(:offer_id, :start_date, :end_date, :price)
    end
end
