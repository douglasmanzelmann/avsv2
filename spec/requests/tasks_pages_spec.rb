require 'spec_helper'

describe "Task Pages" do

  subject { page }

  describe "Creating a Task" do

    let(:submit) { "Create task" }
    before { visit new_task_path }

    describe "with valid information" do 
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
end