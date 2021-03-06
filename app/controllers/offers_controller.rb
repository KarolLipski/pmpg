class OffersController < AdminController
  before_action :set_offer, only: [:edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.includes(titles:[:title_frequency])
      .order('title_frequencies.id').find(params[:id])
    respond_to do |format|
      format.json { render json: @offer}
      format.html do
        offer_pdf = PdfCreation::OfferPdf.new
        @titles = offer_pdf.titles(@offer)
        render layout: false
      end
      format.pdf do
        offer_pdf = PdfCreation::OfferPdf.new
        @titles = offer_pdf.titles(@offer)
        render :pdf => 'offer', layout: 'pdf.html.haml',:margin => {:top => 0,
                           :bottom => 0,
                           :left   => 0,
                           :right  => 0}
      end
    end
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    create_titles
  end

  # GET /offers/1/edit
  def edit
    create_titles
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
        create_titles
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
        create_titles
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
      params.require(:offer).permit(:name, :description, :price,
      :offer_titles_attributes => [:id,:_destroy,:quantity, :title_id])
    end

    #Create titles for nested_attributes
    def create_titles
      Title.all.each do |obj|
        if params[:offer].present?
            selected_hash = params[:offer][:offer_titles_attributes].select {|k,v| v['title_id'] == obj.id.to_s}
            hash_index = selected_hash.keys[0]
          if params[:offer][:offer_titles_attributes][hash_index][:_destroy] == '1'
            @offer.offer_titles.build(title_id: obj.id, quantity: 0)
          end
        else
          if !@offer.title_ids.include?(obj.id)
            @offer.offer_titles.build(title_id: obj.id, quantity: 0)
          end
        end
      end
    end

end
