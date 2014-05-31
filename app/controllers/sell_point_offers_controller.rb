class SellPointOffersController < AdminController
  before_action :set_sell_point_offer, only: [:show, :edit, :update, :destroy]

  def index
    @sell_point = SellPoint.find(params[:sell_point_id])
    @offers = @sell_point.sell_point_offers
  end

  # GET /sell_point_offers/1
  # GET /sell_point_offers/1.json
  def show
  end

  # GET /sell_point_offers/new
  def new
    @sell_point_offer = SellPointOffer.new
  end

  # GET /sell_point_offers/1/edit
  def edit
  end

  # POST /sell_point_offers
  # POST /sell_point_offers.json
  def create
    @sell_point_offer = SellPointOffer.new(sell_point_offer_params)

    respond_to do |format|
      if @sell_point_offer.save
        format.html { redirect_to @sell_point_offer, notice: 'Sell point offer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sell_point_offer }
      else
        format.html { render action: 'new' }
        format.json { render json: @sell_point_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sell_point_offers/1
  # PATCH/PUT /sell_point_offers/1.json
  def update
    respond_to do |format|
      if @sell_point_offer.update(sell_point_offer_params)
        format.html { redirect_to @sell_point_offer, notice: 'Sell point offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sell_point_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sell_point_offers/1
  # DELETE /sell_point_offers/1.json
  def destroy
    @sell_point_offer.destroy
    respond_to do |format|
      format.html { redirect_to sell_point_offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_point_offer
      @sell_point_offer = SellPointOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_point_offer_params
      params[:sell_point_offer]
    end
end
