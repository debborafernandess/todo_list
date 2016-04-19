feature 'Visitor can Sig up' do
  scenario 'successfully' do
    visit root_path

    click_link 'Login'
    click_link 'Sign up'

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: '123456', :match => :prefer_exact
    fill_in 'Password confirmation', with: '123456', :match => :prefer_exact

    click_button 'Sign up'

    expect(page).to have_content('New List')
  end
end
