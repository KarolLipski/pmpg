class PublishersController < AdminController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @publisher = publisher_with_addreses
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, flash: { success: 'Publisher was successfully created.'} }
        format.json { render action: 'show', status: :created, location: @publisher }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'new'
        end
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, flash: { success: 'Publisher was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'edit'
        end
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_params
      params.require(:publisher).permit(:name, addresses_attributes: 
        [:id,:company_name, :street, :street_no, :postal_code, :city,
        :nip, :address_type ], contacts_attributes: [:id,:_destroy,:name, :email, :phone])
    end

    def publisher_with_addreses
      publisher = Publisher.new
      publisher.addresses.build(address_type: 'invoice')
      publisher.addresses.build(address_type: 'correspond')
      publisher.contacts.build
      publisher
    end
end
