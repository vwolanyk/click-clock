class RemoveUnnecessaryColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :work_logs, :start_time
    remove_column :work_logs, :end_time
    remove_column :work_logs, :date

    rename_column :work_logs, :start, :start_time
    rename_column :work_logs, :end, :end_time   
  end
end
