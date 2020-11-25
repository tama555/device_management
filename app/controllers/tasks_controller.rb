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

  def done
    @task = Task.find(params[:id])
    if @task.status == true
      @task.update(status: 0)
    else
      @task.update(status: 1)
    end
    @tasks = Task.all.includes(:user)
    redirect_to root_path
  end

  def complete
    @tasks = Task.includes(:user).order("created_at DESC").where(status: 1)
  end


  def incomplete
    @tasks = Task.includes(:user).order("created_at DESC").where(status: 0)
  end

  def create
    @task = Task.new(task_params)
      
      if @task.save
        redirect_to root_path
      else
        render :new
      end
  end

private
def task_params
  params.require(:task).permit(:submitter, :device_id, :date_of_receipt, :department_id, :trouble_content, :correspondence, :status).merge(user_id: current_user.id)
end

end
