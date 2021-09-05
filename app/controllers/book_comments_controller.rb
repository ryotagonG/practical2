class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    if comment.save
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "コメントを入力してください"
    end
  end
  
  
  def destroy
    @book = Book.find(params[:book_id])
    @comment = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def comment_params
    params.require(:book_comment).permit(:body).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
