class PackagesController < AdminController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.all
  end

  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
    @package.sell_points.build
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html do
          flash[:success] ='Package was successfully created.'
          redirect_to packages_path
        end
        format.json { render action: 'show', status: :created, location: @package }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'new' 
        end
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html do 
          flash[:success] ='Package was successfully updated.'
          redirect_to packages_path
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

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params[:package][:sell_point_ids] ||=[]
      params.require(:package).permit(:name, :description, :price, :sell_point_ids => [])
    end
end
