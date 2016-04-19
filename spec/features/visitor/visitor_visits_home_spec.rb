feature 'Visitor visits Home' do
  before(:example) do
    @user         = create(:user, email: Faker::Internet.email)
    @public_list  = create(:list, user: @user);
    @private_list = create(:list, user: @user, name: Faker::Name.title, private_visibility: true)
  end

  scenario 'successfully' do
    visit root_path

    expect(page).to     have_content('Star Tasks')
    expect(page).to     have_content('Login')
    expect(page).not_to have_content('New List')
  end

  scenario 'and see only public lists' do
    visit root_path

    expect(page).to     have_content(@public_list.name)
    expect(page).not_to have_content(@private_list.name)
  end

  scenario 'and don\'t actions links' do
    visit root_path

    expect(page).not_to     have_content('edit')
    expect(page).not_to have_content('delete')
  end
end
