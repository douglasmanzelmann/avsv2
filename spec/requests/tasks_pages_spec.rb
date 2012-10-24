require 'spec_helper'

describe "Task Pages" do

  let!(:task) { FactoryGirl.create(:task, room: "room 1") }
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

        context "after saving the task" do 
          before { click_button submit }

          it { should have_selector('div.alert.alert-success', text: 'Task saved') }
        end
    end

    context "with invalid information" do 
      it "does not save the task" do 
        expect { click_button submit }.not_to change(Task, :count)
      end

      context "after submission" do
        before { click_button submit } 
        it { should have_selector('div.alert.alert-error') }
      end
    end
  end
  
  describe "Shows a Task" do 
  
      context "with the correct information" do 
        before { visit task_path(task) }
  
        it { should have_selector('h1', text: task.id.to_s) }
        it { should have_selector('li', text: task.day.to_s) }
        it { should have_selector('li', text: task.room) }
        it { should have_selector('li', text: task.begin_time.to_s) }
        it { should have_selector('li', text: task.end_time.to_s) }
        it { should have_selector('li', text: task.gear) }
        it { should have_selector('li', text: task.preset) }
        it { should have_selector('li', text: task.setup) }
        it { should have_selector('li', text: task.strike) }
        it { should have_selector('li', text: task.notes) }
      end
  end
  
  describe "Edits a Task" do
    let(:submit) { "Save changes" }
    let(:new_day) { Date.tomorrow }  
    before { visit edit_task_path(task) }
  
    context "with valid information" do      
      before do 
        fill_in "Day", with: new_day
        click_button submit
      end
  
      it { should have_selector('h1', text: task.id.to_s) }
      it { should have_selector('li', text: new_day.to_s) }
      it { should have_selector('div.alert.alert-success', text: "Task updated") }  
    end

    context "with invalid information" do
      let(:blank_gear) { "" }
      before do 
        fill_in "Day", with: new_day
        fill_in "Gear", with: blank_gear
        click_button submit
      end

      specify { task.day != new_day }
      it { should have_selector('div.alert.alert-error') }
    end
  end

  describe "Shows the index of Tasks" do 
    let!(:t2) { FactoryGirl.create(:task, room: "room 2") }
    before { visit tasks_path } 
  
    it { should have_selector("li##{task.id}", text: "room 1") }
    it { should have_selector("li##{t2.id}", text: "room 2") }        
  end
end