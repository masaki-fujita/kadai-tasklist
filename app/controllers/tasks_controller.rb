class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "メッセージの投稿に成功"
      redirect_to root_url
    else 
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = "メッセージの投稿に失敗"
      render "toppages/index"
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "メッセージを削除"
    redirect_back(fallback_location: root_path)
  end
  def task_params
    params.require(:task).permit(:content, :status)
  end 
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end 
end
