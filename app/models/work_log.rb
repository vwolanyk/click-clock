class WorkLog < ApplicationRecord
  belongs_to :user

  attr_accessor :date, :log_in_time, :log_out_time

  validate :start_time_less_than_end_time
  validate :start_and_end_times_same_day
  validates :start_time, presence: true

  scope :current_day_logs, -> (user_id) {
    where("start_time >= ? and user_id = ? and end_time IS NOT NULL", Time.zone.now.beginning_of_day, user_id).order(start_time: :desc)
  }
  scope :current_open_logs, -> (user_id) {
    where("end_time IS NULL and user_id = ?", user_id)
  }

  def start_time_less_than_end_time
    return true unless end_time.present? && start_time > end_time
    errors.add(:work_log_duration, "end_time must be greater than start_time")
  end

  def start_and_end_times_same_day
    return true unless end_time.present? && start_time.strftime("%B %d, %Y") != end_time.strftime("%B %d, %Y")
    errors.add(:work_log_duration, "end_time must be on the same day")
  end

  def duration_in_hours
    if end_time.present?
      ((end_time - start_time)/3600).round(2)
    else
      "Open Log"
    end
  end

  def formatted_date
    start_time&.strftime("%B %d, %Y")
  end

  def formatted_start_time
    formatted_time(start_time)
  end

  def formatted_end_time
    formatted_time(end_time)
  end

  def formatted_time(timestamp)
    timestamp&.strftime("%I:%M%p")
  end
end
