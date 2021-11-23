class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)

  end

  def new
    # we must define the @article instance variable at new else we cannot ask if there are errors in our template
    # ref: <% if @article.errors.any? %>
    @article = Article.new
  end

  def edit
  end

  def create
    # require/permit allow our application to whitelist title and description for use in our controller
    @article = Article.new(article_params)
    @article.user = User.first
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created sucessfully."
      #redirect_to article_path(@article)
      redirect_to @article
    else 
      # re-render the page and show errors
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end  

  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end