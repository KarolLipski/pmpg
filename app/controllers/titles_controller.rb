class TitlesController < AdminController

  before_action :build_title, only: [:new]
  before_action :load_title, only: [:show, :edit, :update, :destroy]

  def index
    if params[:publisher_id]
      @titles = Publisher.find(params[:publisher_id]).titles
    else
      @titles = Title.includes(:publisher, :title_frequency)
    end
  end
  
  def create
    @title = Title.new(title_params)
    @redirect_to_parent = true if params[:redirect_to_parent].present?
      if @title.save
        flash[:success] = 'Title was created'
        redirect_to_index
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render 'new'
      end
  end

  def update
    @redirect_to_parent = true if params[:redirect_to_parent].present?
      if @title.update(title_params)
        flash[:success] = 'Title was updated'
        redirect_to_index
      else
        flash.now[:error] = 'You have errors in your form , check it.'
        render action: 'edit'
      end
  end

  def destroy
    @title.destroy
    redirect_to(:back)
  end

  def show
  end

  def new
  end

  def edit
  end

  private

    def titles 
      if params[:publisher_id]
        @redirect_to_parent = true
        Publisher.find(params[:publisher_id]).titles 
      else
         Title
      end
    end

    def load_title
      @title = titles.find(params[:id])
    end

    def build_title
      if params[:publisher_id]
        @redirect_to_parent = true
        @title = Publisher.find(params[:publisher_id]).titles.build 
      else
        @title = Title.new
      end
    end

    def redirect_to_index
      if params[:redirect_to_parent].present?
        redirect_to publisher_titles_path @title.publisher
      else
        redirect_to titles_path
      end
    end

    def title_params
      params.require(:title).permit(:title, :title_frequency_id, :archive, :publisher_id)
    end
end
