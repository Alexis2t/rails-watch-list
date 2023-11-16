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
    params.require(:list).permit(:name)
  end

  def set_lists
    @list = List.find(params[:id])
  end
end
