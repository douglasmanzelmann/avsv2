require 'spec_helper'

describe Task do
  before do 
    @task = Task.new(day: Date.today, room: "6W-002", begin_time: Time.now,
                     end_time: 1.hour.from_now, gear: "LCD")
  end

  subject { @task }

  it { should respond_to(:day) }
  it { should respond_to(:room) }
  it { should respond_to(:begin_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:gear) }
  it { should respond_to(:preset) }
  it { should respond_to(:setup) }
  it { should respond_to(:strike) }
  it { should respond_to(:notes) }
end
