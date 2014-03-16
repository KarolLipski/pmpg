class OffersController < AdminController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @offer.titles.build
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html do
          flash[:success] ='Offer was successfully created.'
          redirect_to offers_path
        end
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html do 
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'new'
        end
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html do 
          flash[:success] ='Offer was successfully updated.'
          redirect_to offers_path
        end
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'edit'
        end
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params[:offer][:titles_ids] ||= []
      params.require(:offer).permit(:name, :description, :price, :title_ids => [])
    end

end
