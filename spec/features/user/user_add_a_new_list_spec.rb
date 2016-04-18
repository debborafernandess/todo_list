require 'support/feature_macros'

feature 'User Add a New List' do
  scenario 'sucess' do
    user = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('New List')
    click_link 'New List'
# p page.html
    fill_in 'Name', with: 'My list'
    click_button 'Create List'
  end
end
