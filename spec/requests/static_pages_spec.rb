require 'spec_helper'

describe "Static Pages" do
	describe ".home" do 
		before { visit root_path }

		it "displays the correct h1 text" do 
		  page.should have_selector('h1', text: 'A/V Schedule')
		end

    it "displays the current date"		
	end
end