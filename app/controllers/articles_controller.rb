class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
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
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created scucessfully."
      #redirect_to article_path(@article)
      redirect_to @article
    else 
      # re-render the page and show errors
      render 'new'
    end
  end

  def update
    
  end

end