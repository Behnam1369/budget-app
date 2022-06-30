require 'rails_helper'

RSpec.describe 'Groups tests', type: :feature do
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
  end

  before :each do
    visit '/'
    click_link 'SIGN IN'
    fill_in 'user_email', with: 'behnam.aghaali@yahoo.com'
    fill_in 'user_password', with: '123456'
    click_button 'SIGN IN'
  end

  it 'After sign in groups page should be viewed' do
    expect(page).to have_content 'Total Spent Amount: $ 0'
  end

  it 'By clicking on the new group link it shoulde be redirected to the add group form' do
    click_link 'NEW GROUP'
    expect(page).to have_current_path('/groups/new')
  end

  it 'Should be able to add a group' do
    click_link 'NEW GROUP'
    fill_in 'group_name', with: 'Rent'
    click_button 'Create Group'
    expect(page).to have_content 'Group was successfully created.'
  end

  it 'By pressing the back button we ahould return to the list of groups' do
    click_link 'NEW GROUP'
    fill_in 'group_name', with: 'Rent'
    click_button 'Create Group'
    visit "/groups/#{Group.last.id}/expenditures"
    find('.btn_back').click
    expect(page).to have_current_path('/groups') && have_content(Group.last.name)
  end
end
