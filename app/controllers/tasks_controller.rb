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
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html {
          if @task.category == "時間が決まったタスク"
            redirect_to time_path
          elsif @task.category == "よく使うタスク"
            redirect_to every_path
          elsif @task.category == "たまたま行ったタスク"
            redirect_to by_chance_path
          elsif @task.category == "ToDo"
            redirect_to todo_path
          else
            render :root
          end
        }
        format.json { render :time, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { if @task.category == "時間が決まったタスク"
                        redirect_to time_path
                      elsif @task.category == "よく使うタスク"
                        redirect_to every_path
                      elsif @task.category == "たまたま行ったタスク"
                        redirect_to by_chance_path
                      elsif @task.category == "ToDo"
                        redirect_to todo_path
                      else
                        render :root
                      end }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { if @task.category == "時間が決まったタスク"
                        redirect_to time_path
                      elsif @task.category == "よく使うタスク"
                        redirect_to every_path
                      elsif @task.category == "たまたま行ったタスク"
                        redirect_to by_chance_path
                      elsif @task.category == "ToDo"
                        redirect_to todo_path
                      else
                        render :root
                      end }
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
    # @task.increment!(:good, 1)
    @task = Task.find(params[:id])
    @task.update(good: @task.good += 1)
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
