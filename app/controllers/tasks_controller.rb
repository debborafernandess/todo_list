class TasksController < ApplicationController
  before_action :get_list, only: [:new, :create, :edit]
  before_action :get_task, only: [:edit, :update, :destroy]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to lists_path
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
