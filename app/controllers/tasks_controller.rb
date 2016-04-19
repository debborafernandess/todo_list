class TasksController < ApplicationController
  before_action :get_list, only: [:new, :create]

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
