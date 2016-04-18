feature 'User manage a List' do
  before(:each) do
    @user = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'create with success' do
    expect(page).to have_content('New List')
    click_link 'New List'

    fill_in 'Name', with: 'My list'
    click_button 'Create List'

    within('.list:first-child') { expect(page).to have_content('My list') }
  end

  scenario 'and edit with success' do
    list = create(:list, user: @user)

    visit edit_list_path(list)

    fill_in 'Name', with: 'My list updated'
    click_button 'Update List'

    within('.list:first-child') { expect(page).to have_content('My list updated') }
  end

  scenario 'and destroy with success' do
    list = create(:list, user: @user)

    visit lists_path

    within('.list:first-child') do
      expect{click_link 'delete'}.to change(List, :count).by(-1)
    end
  end
end
