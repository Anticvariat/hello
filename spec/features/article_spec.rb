require 'rails_helper'

RSpec.describe "Log in" do
  #user = new(:user)
  user = User.create(email: "example@mail.ru", password: "123456", first_name: "Qwerty", last_name: "Uiop" )
  context 'log in' do
  it "is valid" do
    visit root_path
    click_on 'Войти'
    fill_in 'Email', with: 'example@mail.ru'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Home page'
    end
  end

  context 'create Article' do
    it "is valid" do
      
      #sign_in user ???

      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: 'example@mail.ru'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content 'example article'
    end
  end
end
