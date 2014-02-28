class IssuesController < AdminController

  before_action :build_issue, only: [:new]
  before_action :load_issue, only: [:show, :edit, :update, :destroy]

  def index
    if params[:publisher_id]
      @issues = Publisher.find(params[:publisher_id]).issues
    else
      @issues = Issue.includes(:publisher, :issue_frequency)
    end
  end
  
  def create
    @issue = Issue.new(issue_params)
    @redirect_to_parent = true if params[:redirect_to_parent].present?
      if @issue.save
        flash[:success] = 'Issue was created'
        redirect_to_index
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render 'new'
      end
  end

  def update
    @redirect_to_parent = true if params[:redirect_to_parent].present?
      if @issue.update(issue_params)
        flash[:success] = 'Issue was updated'
        redirect_to_index
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render action: 'edit'
      end
  end

  def destroy
    @issue.destroy
    redirect_to(:back)
  end

  def show
  end

  def new
  end

  def edit
  end

  private

    def issues 
      if params[:publisher_id]
        @redirect_to_parent = true
        Publisher.find(params[:publisher_id]).issues 
      else
         Issue
      end
    end

    def load_issue
      @issue = issues.find(params[:id])
    end

    def build_issue
      if params[:publisher_id]
        @redirect_to_parent = true
        @issue = Publisher.find(params[:publisher_id]).issues.build 
      else
        @issue = Issue.new
      end
    end

    def redirect_to_index
      if params[:redirect_to_parent].present?
        redirect_to publisher_issues_path @issue.publisher
      else
        redirect_to issues_path
      end
    end

    def issue_params
      params.require(:issue).permit(:title, :issue_frequency_id, :archive, :publisher_id)
    end
end
