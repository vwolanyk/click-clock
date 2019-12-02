class WorkLog < ApplicationRecord
  belongs_to :user

  scope :current_day_logs, -> (user) { where(date: Date.today, user: user) }
  scope :current_open_log, -> (user) { where(end_time: nil, user: user).limit(1)}

  def formatted_date
    date.strftime("%B %d, %Y")
  end

  def formatted_start_time
    formatted_time(start_time)
  end

  def formatted_end_time
    formatted_time(start_time)
  end

  def formatted_time(timestamp)
    timestamp.strftime("%I:%M%p")
  end
end
