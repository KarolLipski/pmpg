class SellPointsController < AdminController
  before_action :set_sell_point, only: [:show, :edit, :update, :destroy]

  def index
    @sell_points = SellPoint.all
  end

  def show
    respond_to do |format|
      format.json do
        addresses = {}
        @sell_point.addresses.each do |ad|
          addresses[ad.address_type.to_sym] = ad  
        end
        json = {:sell_point => @sell_point, :addresses => addresses}.to_json
        render json: json
      end
      format.html {}
    end
  end

  def new
    @sell_point = sell_point_with_addresses
    @sell_point.packages.build
  end

  def edit
  end

  def create
    @sell_point = SellPoint.new(sell_point_params)
      if @sell_point.save
        if params[:sell_point][:chained] == 'true' && params[:sell_point][:chain_id] == ''
          chain = create_chain(@sell_point.name);
          @sell_point.chain_id = chain.id
          @sell_point.save
        end
        flash[:success] = 'Sell point was successfully created'
        redirect_to sell_points_path
      else
        flash.now[:error] = 'You have errors in your form, check it'
        render action: 'new'
      end
  end

  def update
    params[:sell_point][:chain_id] = nil if params[:sell_point][:chained] == 'false'
    respond_to do |format|
      if @sell_point.update(sell_point_params)
        format.html { redirect_to sell_points_path, flash: { success: 'Sell point was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'edit'
        end
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
      params[:sell_point][:package_ids] ||=[]
      params.require(:sell_point).permit(:name, :chain_id, :package_ids =>[], addresses_attributes: 
        [:id,:company_name, :street, :street_no, :postal_code, :city,
        :nip, :address_type ], contacts_attributes: [:id,:_destroy,:name, :email, :phone])
    end

    def sell_point_with_addresses
      sell_point = SellPoint.new
      %w[invoice correspond delivery].each do |type|
        sell_point.addresses.build(address_type: type)
      end
      sell_point.contacts.build
      sell_point
    end

    def create_chain(name)
      chain = Chain.new(name: name)
      params[:sell_point][:addresses_attributes].each do | key, address|
        if address[:address_type].in? %w[invoice correspond]
          chain.addresses << Address.new(address)
        end
      end
      chain.save
      return chain
    end
end
