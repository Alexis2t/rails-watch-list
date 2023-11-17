class ListsController < ApplicationController
  before_action :set_lists, only: %i[show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.banner_url.empty?
      @list.banner_url = 'https://cdn.dribbble.com/userupload/4150478/file/original-6d61a13e32199b9fda2f3bbdf803b823.png?resize=800x600'
    end
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookmarks = Bookmark.where(list: @list.id)
  end

  private

  def list_params
    params.require(:list).permit(:name, :banner_url)
  end

  def set_lists
    @list = List.find(params[:id])
  end
end
