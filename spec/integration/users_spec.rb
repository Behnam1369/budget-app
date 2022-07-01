require 'rails_helper'

RSpec.describe 'Users tests', type: :feature do
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
  end

  before :each do
    visit '/'
  end

  it 'Splash screen should be the defualt page' do
    expect(page).to have_content 'My Expenditures'
  end

  it 'By clicking on the Sign in link it shoulde be redirected to the sign in page' do
    click_link 'SIGN IN'
    expect(page).to have_current_path('/users/sign_in')
  end

  it 'Detail error with wrong credentials' do
    click_link 'SIGN IN'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'SIGN IN'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Correct Log in and redirect to HomePage' do
    click_link 'SIGN IN'
    fill_in 'user_email', with: 'behnam.aghaali@yahoo.com'
    fill_in 'user_password', with: '123456'
    click_button 'SIGN IN'
    expect(page).to have_current_path('/')
  end
end
