class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :edit, :update, :destroy, :user]
  before_action :authorize
  # GET /tasks
  # GET /tasks.json
  # def index
  #   #@tasks = Task.order('start_date DESC').page params[:page]
  #  # @tasks = Task.search(params[:term])
  #   @tasks = if params[:term]
  #     Task.where('name LIKE ? or status LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%").page params[:page]
  #   else
  #     Task.order('start_date DESC').page params[:page]
  #   end
  # end

  def index
    @tasks = if params[:term]
      Task.where('status LIKE ? or name LIKE ?', "%#{params[:term]}%","%#{params[:term]}%").page params[:page]
    elsif params[:term1]
      Task.where('name LIKE ?', "%#{params[:term1]}%").page params[:page]
    elsif params[:term2]
      Task.where('status LIKE ?', "%#{params[:term2]}%").page params[:page]
    else
      #@tasks = Task.all.order('created_at desc').page params[:page]
      @tasks = Task.order_list(params[:sort_by]).page params[:page]
    end
  end
  def task_params
    params.require(:task).permit(:name, :content, :status, :priority, :start_date, :end_date)
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end
  def search
    @task =task.search(params[:search])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)


    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :user_id, :content, :status, :priority, :start_date, :end_date)
    end
    def self.search(term)
      if term
        where('name LIKE ?', "%#{term}%").order('id DESC')
      else
        order('id DESC')
      end
    end
end
