feature 'User manage a List', js: true do
  before(:example) do
    @user = create(:user)

    visit new_user_session_path

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'create with success' do
    click_link '+ List'

    fill_in 'Name', with: 'My list'
    click_button 'Create List'

    within("div#lists") { expect(page).to have_content('My list') }
  end

  scenario 'and edit with success' do
    list = create(:list, user: @user)

    visit edit_list_path(list)

    fill_in 'Name', with: 'My list updated'
    check   'Private?'

    click_button 'Update List'

    expect(page).to have_content('My list updated')
  end

  scenario 'and destroy with success' do
    list = create(:list, user: @user)

    visit lists_path

    within("div#list_#{list.id} .actions") do
      click_link 'delete'
    end

    expect(page).not_to have_content("div#list_#{list.id}")
  end
end
