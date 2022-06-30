require 'rails_helper'

RSpec.describe 'Expenditures tests', type: :feature do
  before :all do
    @user1 = User.create(
      name: 'Behnam',
      email: 'behnam.aghaali@yahoo.com',
      password: '123456',
      created_at: '2022-06-30 01:40:30.027196000 +0000',
      confirmed_at: '2022-06-30 21:22:04.937699'
    )
  end

  after :all do
    @user1.destroy
    Group.destroy_all
    Expenditure.destroy_all
  end

  before :each do
    visit '/'
    click_link 'SIGN IN'
    fill_in 'user_email', with: 'behnam.aghaali@yahoo.com'
    fill_in 'user_password', with: '123456'
    click_button 'SIGN IN'
    click_link 'NEW GROUP'
    fill_in 'group_name', with: 'Rent'
    click_button 'Create Group'
  end

  it 'After creating a group its transactions page should be loaded' do
    expect(page).to have_current_path "/groups/#{Group.last.id}/expenditures"
  end

  it 'By clicking on the new expenditure link it shoulde be redirected to the add expenditure form' do
    click_link 'NEW EXPENDITURE'
    expect(page).to have_current_path("/groups/#{Group.last.id}/expenditures/new")
  end

  it 'By clicking on the back button on new expenditure form it should be redirected to the list of expenditures for the grouo' do
    click_link 'NEW EXPENDITURE'
    find('.btn_back').click
    expect(page).to have_current_path "/groups/#{Group.last.id}/expenditures"
  end

  it 'Should be able to add an expenditure' do
    click_link 'NEW EXPENDITURE'
    fill_in 'expenditure_name', with: 'Rent - JAN 2022'
    fill_in 'expenditure_amount', with: '1500'
    click_button 'Create Expenditure'
    expect(page).to have_content 'Rent - JAN 2022'
  end
end
