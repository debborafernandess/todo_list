class ListsController < ApplicationController
  before_action :get_list, only: [:edit, :update, :destroy, :favorite]

  def index
    @lists = List.public_or_own(current_user.id).order(created_at: :desc, updated_at: :desc)
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

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def favorite
    @list.favorites.create(user: current_user)
    redirect_to lists_path
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :private_visibility)
  end
end
