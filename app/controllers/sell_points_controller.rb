class SellPointsController < AdminController
  before_action :set_sell_point, only: [:show, :edit, :update, :destroy]

  def index
    @sell_points = SellPoint.all
  end

  def show
  end

  def new
    @sell_point = sell_points_with_addresses
  end

  def edit
  end

  def create
    @sell_point = SellPoint.new(sell_point_params)

    respond_to do |format|
      if @sell_point.save
        format.html { redirect_to @sell_point, notice: 'Sell point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sell_point }
      else
        format.html { render action: 'new' }
        format.json { render json: @sell_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sell_point.update(sell_point_params)
        format.html { redirect_to @sell_point, notice: 'Sell point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sell_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sell_point.destroy
    respond_to do |format|
      format.html { redirect_to sell_points_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_point
      @sell_point = SellPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_point_params
      params.require(:sell_point).permit(:name, :chain_id)
    end

    def sell_points_with_addresses
      sell_point = SellPoint.new
      sell_point.addresses.build(address_type: 'invoice')
      sell_point.addresses.build(address_type: 'correspond')
      sell_point.addresses.build(address_type: 'delivery')
      sell_point.contacts.build
      sell_point
    end
end
