require 'spec_helper'

feature 'adding credit to the machine' do
  scenario 'adds 50 credits to the machine' do
    visit('/')
    fill_in :credit, with: 50
    click_button 'Submit'
    expect(page).to have_content '50 Credits'
  end
end

xfeature 'removes a credit when the player gambles' do
  scenario 'the gambler starts with 20 credits' do
    visit('/')
    fill_in :credit, with: 50
    click_button 'Submit'
    click_button 'Play!'
    expect(page).to have_content '49 Credits'
  end
end
