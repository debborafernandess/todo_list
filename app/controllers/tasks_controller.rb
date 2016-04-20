class TasksController < ApplicationController
  respond_to :html, :js

  before_action :get_list, only: [:new, :create, :edit]
  before_action :get_task, only: [:edit, :update, :destroy]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)
    flash[:notice] = "Task was successfully created." if @task.save
  end

  def edit; end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def get_task
    @task = Task.find(params[:id])
  end

  def get_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
