class Task < ActiveRecord::Base
  attr_accessible :begin_time, :day, :end_time, :gear, :notes, :preset, :room, :setup, :strike
end
