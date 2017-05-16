class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  # Process the form
  def create        # POST /restaurants
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update(task_params)
  @task.save
  redirect_to tasks_path
end


def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path
end


  private
  def task_params
    params.require(:task).permit(:name)
  end
end
# form for new task
# submit form to create action
# redirect to index action after create
