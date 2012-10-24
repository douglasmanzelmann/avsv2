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
    
      context "displays a task in the table" do
        it { should have_selector('td', text: task.room) }
        it { should have_selector('td', text: task.begin_time.to_s) }
        it { should have_selector('td', text: task.end_time.to_s) }
        it { should have_selector('td', text: task.gear) }
        it { should have_selector('td', text: task.preset) }
        it { should have_selector('td', text: task.setup) }
        it { should have_selector('td', text: task.strike) }
        it { should have_selector('td', text: task.notes) }
      end  
    end

  end
end