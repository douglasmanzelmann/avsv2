class Task < ActiveRecord::Base
  attr_accessible :begin_time, :day, :end_time, :gear, :notes, :preset, :room, :setup, :strike

  validates :room, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :gear, presence: true
  validates :day, presence: true
end
