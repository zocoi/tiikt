class MainController < ApplicationController
  respond_to :html, :json
  
  def index
    # if current_user
    #   @books = current_user.books.limit(30)
    # else
    #   @books = Book.order("created_at DESC").limit(30)
    # end
    # @books = Book.order("created_at DESC").limit(5)
    # 
    # @collections = Collection.order("created_at DESC").limit(5)

    # if current_user
    #   redirect_to tasks_path
    # end
      
  end
end
