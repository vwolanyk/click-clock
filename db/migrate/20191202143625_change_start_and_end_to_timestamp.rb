class ChangeStartAndEndToTimestamp < ActiveRecord::Migration[5.2]
  def change
      add_column :work_logs, :start, :timestamptz
      add_column :work_logs, :end, :timestamptz
  end
end
