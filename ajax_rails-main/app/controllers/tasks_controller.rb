class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end


  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    respond_to do |format|
      if @task.save
          format.html {
            redirect_to root_path
            flash[:notice] = "Task created"}
          format.js { }
      else
          format.html {
            redirect_to root_path
            flash[:notice] = "Please try again"}
          format.js { }
      end
    end
  end
  

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    puts "#" * 50
    puts params 
    puts "#" * 50

    if params[:task_status].nil?
      @task.update(status: false)
    else
      @task.update(status: true)
    end

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = "Task updated"}
      format.js { }
    end
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.destroy
        format.html {
          redirect_to root_path
          flash[:notice] = "Task deleted"}
        format.js { }
      else
        format.html {
          redirect_to root_path
          flash[:notice] = "Did not deleted task"}
        format.js { }
      end
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
