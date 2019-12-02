class PagesController < ApplicationController
  def home
    @current_open_log = WorkLog.current_open_log(current_user)
    @current_day_logs = WorkLog.current_day_logs(current_user)
  end
end
