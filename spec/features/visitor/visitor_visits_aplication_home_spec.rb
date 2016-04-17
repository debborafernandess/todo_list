require 'rails_helper'

feature 'visitor_visits_aplication_home_spec' do
  before(:each) do
  @user         = create(:user)
  @public_list  = create(:list, user: @user);
  @private_list = create(:list, user: @user, name: Faker::Name.name, private_visibility: true)
  end

scenario 'success' do
  visit root_path

  expect(page).to     have_content('Star Tasks')
  expect(page).to     have_content('Sign Up')
  expect(page).to     have_content('Login')
  expect(page).not_to have_content('New List')
end

scenario 'and see only public lists' do
  visit root_path

  expect(page).to     have_content(@public_list.name)
  expect(page).not_to have_content(@private_list.name)
  end
end
