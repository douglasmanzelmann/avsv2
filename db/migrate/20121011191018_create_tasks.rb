class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date :day
      t.string :room
      t.time :begin_time
      t.time :end_time
      t.string :gear
      t.string :preset
      t.string :setup
      t.string :strike
      t.text :notes

      t.timestamps
    end
  end
end
