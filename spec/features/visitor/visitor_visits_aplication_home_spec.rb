require 'rails_helper'

feature 'visitor_visits_aplication_home_spec' do
	scenario 'success' do
		visit root_path

		expect(page).to 		have_content('Star Tasks')
		expect(page).to 		have_content('Sign Up')
		expect(page).to 		have_content('Login')
	end
end
