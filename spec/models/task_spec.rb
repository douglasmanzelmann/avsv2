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

  context "when day is not present" do
    before { @task.day = nil } 
    it { should_not be_valid }
  end

  context "when begin_time is not present" do 
    before { @task.begin_time = nil } 
    it { should_not be_valid }
  end

  context "when end_time is not present" do 
    before { @task.end_time = nil } 
    it { should_not be_valid } 
  end 

  context "when gear is not present" do 
    before { @task.gear = nil } 
    it { should_not be_valid } 
  end

  context "when room is not present" do 
    before { @task.room = nil } 
    it { should_not be_valid } 
  end

  it "has a valid factory" do
    FactoryGirl.create(:task).should be_valid
  end

  context "when a task is added the next day in the same room with the same gear" do 
    let!(:task1) { FactoryGirl.create(:task) }
    let!(:task2) { FactoryGirl.create(:task, day: Date.tomorrow) }
    subject { task1 }

    its(:notes) { should == "There is a meeting in this room tomorrow."}
  end  
end 