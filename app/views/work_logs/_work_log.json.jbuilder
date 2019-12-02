json.extract! work_log, :id, :date, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url work_log_url(work_log, format: :json)
