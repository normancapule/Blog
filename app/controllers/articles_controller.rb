class ArticlesController < ApplicationController
  def index
    @author = Author.find params[:author_id]#author_id because of nest, look at routes
    @articles = @author.articles
  end

  def show
    @author = Author.find params[:author_id]
    @articles = @author.articles.find params[:id]
    @comments = @articles.comments
    @comment_new = @articles.comments.new
  end

  def new
   @author = Author.find params[:author_id]
   @articles = @author.articles.build #creates an empty record
  end

  def create
   @author = Author.find params[:author_id]
   @articles = @author.articles.build(params[:article])
   if @articles.save
    redirect_to author_articles_path(@author), :notice => "Article Created"
   else
    render :action => "new" 
   end
  end

  def edit
   @author = Author.find params[:author_id]
   @articles = @author.articles.find params[:id]
  end

  def update
   @author = Author.find params[:author_id]
   @articles = @author.articles.find params[:id]
   if @articles.update_attributes(params[:article])
    redirect_to author_articles_path(@author), :notice => "Article Updated"
   else
    render :action => "new" 
    end
  end

  def destroy
    @author = Author.find params[:author_id]
    @articles = @author.articles.find params[:id]
    @articles.destroy
    redirect_to author_articles_path(@author), :notice => "Article Destroyed"
  end
end
