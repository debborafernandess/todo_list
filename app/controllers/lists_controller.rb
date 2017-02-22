class ListsController < ApplicationController
  respond_to :html, :js

  before_action :get_list, only: [:edit, :update, :destroy, :favorite]

  def index
    @lists = List.publics_and_owned(current_user).order(created_at: :desc, updated_at: :desc)
    respond_with @lists
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    @list.save
  end

  def edit; end

  def update
    @list.update(list_params)
  end

  def destroy
    @list.destroy
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
