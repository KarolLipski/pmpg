class SellPointsController < ApplicationController
  before_action :set_sell_point, only: [:show, :edit, :update, :destroy]

  # GET /sell_points
  # GET /sell_points.json
  def index
    @sell_points = SellPoint.all
  end

  # GET /sell_points/1
  # GET /sell_points/1.json
  def show
  end

  # GET /sell_points/new
  def new
    @sell_point = SellPoint.new
  end

  # GET /sell_points/1/edit
  def edit
  end

  # POST /sell_points
  # POST /sell_points.json
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

  # PATCH/PUT /sell_points/1
  # PATCH/PUT /sell_points/1.json
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

  # DELETE /sell_points/1
  # DELETE /sell_points/1.json
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
end
