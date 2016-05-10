require 'rails_helper'

feature 'User can', :type => :feature do
  def login(user=nil)
    @user = user || create(:user)

    visit new_user_session_path

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'favorite list from others users' do
    list          = create(:list)
    logged_user   = create(:user, email: Faker::Internet.email)
    login(logged_user)

    within("div#list_#{list.id}") do
      expect{click_link 'Favorite'}.to change(list.favorites, :count).by(1)
      expect{click_link 'Favorite'}.to change(logged_user.favorites, :count).by(1)
    end

    within("div#list_#{list.id}") do
      expect(page).to have_content("Favorited")
    end
  end
end
