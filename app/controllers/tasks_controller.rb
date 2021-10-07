class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  # リダイレクト先を仮でtime_path
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to time_path, notice: "Task was successfully created." }
        format.json { render :time, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  # リダイレクト先を仮でtime_path
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to time_path, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  # リダイレクト先を仮でtime_path
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to time_path, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def time
    @task = Task.new
    @tasks = Task.where(category:0)
  end

  def every
    @task = Task.new
    @tasks = Task.where(category:1)
  end

  def todo
    @task = Task.new
    @tasks = Task.where(category:3)
  end

  def by_chance
    @task = Task.new
    @tasks = Task.where(category:2)
  end

  def good
    @task = Task.good
    @task.increment!(:good, 1)
    # @task = Task.find(params[:id])
    # p = @task.good + 1
    # @task.update(good: p)
    # redirect_to time_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def task_params
    #   params.fetch(:task, {})
    # end

    def task_params
      params.require(:task).permit(:sentence, :category, :good, :time,)
    end
end
