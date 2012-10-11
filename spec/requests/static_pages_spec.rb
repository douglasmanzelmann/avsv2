require 'spec_helper'

describe "Static Pages" do
	describe "#home" do 
		before { visit root_path }

		it "displays A/V Schedule Branding in <header>" do 
		  page.find('header').should have_selector('a', text: 'A/V Schedule')
		end

    it "displays the current date" do 
      page.should have_selector('h1', text: "#{Date.today.strftime('%A, %B %d, %Y')}")
    end

    it "displays a link to the previous day" do 
      page.find('h1').should have_selector('a', text: '<<')
    end

    it "displays a link to the next day" do 
      page.find('h1').should have_selector('a', text: '>>')
    end
	end
end