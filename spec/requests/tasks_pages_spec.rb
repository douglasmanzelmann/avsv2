require 'spec_helper'

describe "Task Pages" do

  let(:task) { FactoryGirl.create(:task) }
  subject { page }
    
    describe "Creates a Task" do
  
      let(:submit) { "Create task" }
      before { visit new_task_path }
  
      context "with valid information" do 
        before do 
          fill_in "Day",    with: Date.today
          fill_in "Room",   with: "6W-002"
          fill_in "Begin",  with: Time.now
          fill_in "End",    with: 1.hour.from_now
          fill_in "Gear",   with: "LCD"
        end
  
        it "creates a Task" do 
          expect { click_button submit }.to change(Task, :count).by(1)
        end
      end
    end
  
    describe "Shows a Task" do 
  
      context "with the corret information" do 
        before { visit task_path(task) }
  
        it { should have_selector('h1', text: "#{task.id}") }
        it { should have_selector('li', text: "#{task.day}") }
        it { should have_selector('li', text: "#{task.room}") }
        it { should have_selector('li', text: "#{task.begin_time}") }
        it { should have_selector('li', text: "#{task.end_time}") }
        it { should have_selector('li', text: "#{task.gear}") }
        it { should have_selector('li', text: "#{task.preset}") }
        it { should have_selector('li', text: "#{task.setup}") }
        it { should have_selector('li', text: "#{task.strike}") }
        it { should have_selector('li', text: "#{task.notes}") }
      end
  
    end
  
    describe "Edits a Task" do
      let(:submit) { "Update task" }
      before { visit edit_task_path(task) }
  
      context "with valid information" do
        let(:new_day) { Date.tomorrow }  
      
        before do 
          fill_in "Day", with: new_day
          click_button "Save changes"
        end
  
        it { should have_selector('h1', text: "#{task.id}") }
        it { should have_selector('li', text: "#{new_day}") }
  
      end
    end

    describe "Shows the index of Tasks" do 
      let(:t2) { FactoryGirl.create(:t2, room: "room 2") }
      before { visit tasks_path } 
  
      it { should have_selector('l1', text: "#{task.day} | #{task.room}") }
      it { should have_selector('li', text: "#{t2.day} | #{t2.room}") }
  end
end