require 'spec_helper'

feature 'Creating Instructions' do
  scenario "can create a list of instructions" do
    visit '/'
    click_link 'New set of Instructions'
    fill_in 'Topic', :with => 'Cookies'
    click_button 'Create Instructions'
    page.should have_content('Instruction set has been created.')
    instruction = Instruction.find_by_topic("Cookies")
    page.current_url.should == instruction_url(instruction)
    title = "Cookies - Instructions - HowTo"
    find("title").should have_content(title)
  end
end
