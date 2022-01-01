class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.create! params.required(:comment).permit(:content)
    CommentsMailer.submitted(@comment).deliver_later
    redirect_to @article
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end
end
