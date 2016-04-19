feature 'User' do
  before(:each) do
    @user        = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)
    @second_user = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'see your own lists' do
    own_list    = create(:list, user: @user)

    visit lists_path

    expect(page).to have_content(own_list.name)
  end

  scenario 'and all the others public lists' do
    own_list    = create(:list, user: @user)
    public_list = create(:list, user: @second_user)

    visit lists_path

    expect(page).to have_content(own_list.name)
    expect(page).to have_content(public_list.name)
  end

  scenario 'and don\'t see private lists from others users' do
    own_list     = create(:list, user: @user)
    private_list = create(:list, user: @second_user, name: Faker::Name.title, private_visibility: true)

    visit lists_path

    expect(page).to have_content(own_list.name)
    expect(page).not_to have_content(private_list.name)
  end
end
