require 'spec_helper'

describe "Static Pages" do
	describe "#home" do
    let!(:task) { FactoryGirl.create(:task) }  
		before { visit root_path }
    subject { page }    

    it "displays 'Home' link in header" do  
      page.find('header').should have_selector('a', text: "Home")
    end

    it "displays 'Sign up' link in header" do  
      page.find('header').should have_selector('a', text: "Sign up")
    end

    it "displays 'Login' link in header" do  
      page.find('header').should have_selector('a', text: "Login")
    end

		it "displays A/V Schedule Branding in <header>" do 
		  page.find('header').should have_selector('a', text: 'A/V Schedule')
		end

    it "displays the current date" do 
      page.should have_selector('h1', text: Date.today.strftime('%A, %B %d, %Y') )
    end

    it "displays a link to the previous day" do 
      page.should have_selector('a', text: '<<')
      click_link '<<'
      page.should have_selector('h1', text: Date.yesterday.strftime('%A, %B %d, %Y') )
    end

    it "displays a link to the next day" do 
      page.should have_selector('a', text: '>>')
      click_link '>>'
      page.should have_selector('h1', text: Date.tomorrow.strftime('%A, %B %d, %Y') )
    end

    it "has the right links on the navbar" do 
      click_link 'Home'
      page.should have_selector('title', title: 'Avsv2')
    end

    describe "Tasks table" do
      it { should have_selector('th', text: "Room") }
      it { should have_selector('th', text: "Time") }
      it { should have_selector('th', text: "Gear") }
      it { should have_selector('th', text: "Preset") }
      it { should have_selector('th', text: "Setup") }
      it { should have_selector('th', text: "Strike") }
      it { should have_selector('th', text: "Notes") }

      context "displays specific day's tasks only" do
        let!(:yesterday) { FactoryGirl.create(:task, day: Date.today.yesterday,
                                               room: "yesterday") }
        let!(:tomorrow) { FactoryGirl.create(:task, day: Date.today.tomorrow,
                                              room: "tomorrow") }

        context ": today" do
          it { should have_selector('td', text: task.room) }
          it { should have_selector('td', text: task.begin_time.to_s) }
          it { should have_selector('td', text: task.end_time.to_s) }
          it { should have_selector('td', text: task.gear) }
          it { should have_selector('td', text: task.preset) }
          it { should have_selector('td', text: task.setup) }
          it { should have_selector('td', text: task.strike) }
          it { should have_selector('td', text: task.notes) }

          it { should_not have_selector('td', text: yesterday.room) }
          it { should_not have_selector('td', text: tomorrow.room) }   
        end

        context ": yesterday" do 
          before do 
            click_link '<<'
          end  

          it { should have_selector('td', text: yesterday.room) }
          it { should have_selector('td', text: yesterday.begin_time.to_s) }
          it { should have_selector('td', text: yesterday.end_time.to_s) }
          it { should have_selector('td', text: yesterday.gear) }
          it { should have_selector('td', text: yesterday.preset) }
          it { should have_selector('td', text: yesterday.setup) }
          it { should have_selector('td', text: yesterday.strike) }
          it { should have_selector('td', text: yesterday.notes) }

          it { should_not have_selector('td', text: task.room) }
          it { should_not have_selector('td', text: tomorrow.room) }
        end

        context ": tomorrow" do 
          before do 
            click_link '>>'
          end  

          it { should have_selector('td', text: tomorrow.room) }
          it { should have_selector('td', text: tomorrow.begin_time.to_s) }
          it { should have_selector('td', text: tomorrow.end_time.to_s) }
          it { should have_selector('td', text: tomorrow.gear) }
          it { should have_selector('td', text: tomorrow.preset) }
          it { should have_selector('td', text: tomorrow.setup) }
          it { should have_selector('td', text: tomorrow.strike) }
          it { should have_selector('td', text: tomorrow.notes) }

          it { should_not have_selector('td', text: task.room) } 
          it { should_not have_selector('td', text: yesterday.room) }           
        end
      end
    end
  end
end