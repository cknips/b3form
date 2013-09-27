class TasksController < ApplicationController
  def index
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(tasks_params)

    if @task.save
      redirect_to new_task_path
    else
      render action: 'new'
    end
  end


  private

  def tasks_params
    params.require(:task).permit!
  end
end
