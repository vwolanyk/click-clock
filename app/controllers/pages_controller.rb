class PagesController < ApplicationController
  def home
    @current_open_logs = WorkLog.current_open_logs(current_user.id)
    @current_day_logs = WorkLog.current_day_logs(current_user.id)
    @work_log = WorkLog.new
  end
end
