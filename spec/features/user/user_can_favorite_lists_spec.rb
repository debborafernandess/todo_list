feature 'User can' do
  before(:example) do
    @logged_user  = create(:user)
    @user_list    = create(:user)

    @list = create(:list, user: @user_list)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: @logged_user.email
    fill_in 'Password', with: @logged_user.password

    click_button 'Log in'
  end

  scenario 'favorite list from others users' do
    within("div#list_#{@list.id}") do
      expect{click_link 'Favorite'}.to change(@list.favorites, :count).by(1)
      expect{click_link 'Favorite'}.to change(@logged_user.favorites, :count).by(1)
    end
  end
end
