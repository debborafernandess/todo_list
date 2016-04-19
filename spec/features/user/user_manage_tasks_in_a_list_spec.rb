feature 'User manage tasks in a List' do
  before(:each) do
    @user = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)
    @list = create(:list, user: @user)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'create tasks to List' do
    expect(page).to have_link 'Add task'
  end
end
