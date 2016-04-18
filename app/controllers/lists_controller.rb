class ListsController < ApplicationController

  def index
    @lists = List.order(created_at: :desc)
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
