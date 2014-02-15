class IssuesController < AdminController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def index
    if params[:publisher_id]
      @publisher = Publisher.find(params[:publisher_id]) 
      @issues = @publisher.issues
    else
      @issues = Issue.includes(:publisher, :issue_frequency)
    end
  end

  def show
  end

  def new
    if params[:publisher_id]
      @publisher = Publisher.find(params[:publisher_id]) 
      @issue = @publisher.issues.build
      @redirect_to_parent = true
    else
      @issue = Issue.new
    end
  end

  def edit
    if params[:publisher_id].present?
      @redirect_to_parent = true
    end
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @redirect_to_parent = true if params[:redirect_to_parent].present?
    respond_to do |format|
      if @issue.save
        format.html do
          if params[:redirect_to_parent].present?
            redirect_to publisher_issues_path @issue.publisher
          else
            redirect_to issues_path
          end
        end
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render 'new'
        end
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    @redirect_to_parent = true if params[:redirect_to_parent].present?
    respond_to do |format|
      if @issue.update(issue_params)
        format.html do
          if params[:redirect_to_parent].present?
            redirect_to publisher_issues_path @issue.publisher
          else
            redirect_to issues_path
          end
        end
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = 'You have errors in your form , check it.'
          render action: 'edit'
        end
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :issue_frequency_id, :archive, :publisher_id)
    end
end
