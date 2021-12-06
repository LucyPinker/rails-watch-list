class ListsController < ApplicationController

def index
  @lists = List.all
end

def show
  @list = List.find(params[:id])
  @review = Review.new
  @bookmarks = @list.bookmarks
  @reviews = @list.reviews
end

def new
  @list = List.new
end

def create
@list = List.new(list_params)
#file = URI.open("")
#@list.picture.attach(io: file, filename: 'coupon.png', content_type: 'image/png')
  if @list.save
    redirect_to lists_path
  end
end

def destroy
  @list = List.find(params[:id])
  if @list.destroy
    redirect_to lists_path
  end
end

private

  def list_params
    params.require(:list).permit(:name)
  end
end
