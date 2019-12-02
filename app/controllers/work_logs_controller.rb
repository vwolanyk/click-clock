class WorkLogsController < ApplicationController
  before_action :set_work_log, only: [:edit, :update, :destroy]
  # make sure only the work log owner can see their own logs
  before_action :current_user_authorized?, only: [:edit, :update, :destroy]

  # GET /work_logs
  # GET /work_logs.json
  def index
    @work_logs = current_user.work_logs.order(start_time: :desc)
  end

  def new
    @work_log = current_user.work_logs.new
  end

  # GET /work_logs/1/edit
  def edit
  end

  # POST /work_logs
  # POST /work_logs.json
  def create
    @work_log = WorkLog.new(work_log_params)
    @work_log.user = current_user

    respond_to do |format|
      if @work_log.save
        format.html { redirect_to root_path, notice: 'Work log was successfully created.' }
        format.json { render :show, status: :created, location: @work_log }
      else
        format.html { render :new }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_logs/1
  # PATCH/PUT /work_logs/1.json
  def update
    respond_to do |format|
      if @work_log.update(work_log_params)
        format.html { redirect_to   root_path, notice: 'Work log was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_log }
      else
        format.html { render :edit }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_logs/1
  # DELETE /work_logs/1.json
  def destroy
    @work_log.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Work log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_log
      @work_log = WorkLog.find_by(id: params[:id])
      redirect_to root_path unless @work_log.present?
    end

    def current_user_authorized?
      return true if current_user.id == @work_log.user_id
      redirect_to root_path
    end

    def work_log_params
      params.require(:work_log).permit(:start_time, :end_time, :user_id)
    end
end
