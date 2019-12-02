class CreateWorkLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :work_logs do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
