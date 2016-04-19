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

    within("div#list_#{@list.id}") { click_link 'Add task' }

    fill_in "Title", with: 'a new task'
    click_button 'Create Task'

    within("div#list_#{@list.id}") do
      expect(page).to have_content('a new task')
    end
  end

  scenario 'update tasks to List' do
    task = create(:task, list: @list)

    within("div#task_#{task.id}") { click_link 'edit' }

    fill_in "Title", with: 'a updated task'
    click_button 'Update Task'

    within("div#task_#{task.id}") do
      expect(page).to have_content('a updated task')
    end
  end
end
