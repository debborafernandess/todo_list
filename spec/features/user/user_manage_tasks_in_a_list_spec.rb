feature 'User manage tasks in a List', js: true do
  before(:example) do
    @user = create(:user, email: Faker::Internet.email, password: Faker::Internet.password)
    @list = create(:list, user: @user)
    @task = create(:task, list: @list)

    visit root_path

    click_link 'Login'

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'create tasks', js: true do
    within("div#list_#{@list.id}") { click_link 'Add task' }

    fill_in "Title", with: 'a new task'
    click_button 'Create Task'

    within("div#list_#{@list.id}") do
      expect(page).to have_content('a new task')
    end
  end

  scenario 'update task', js: true do
    within("#list_#{@list.id}") do
      within("#task_#{@task.id}") { click_link 'edit' }
    end

    fill_in "Title", with: 'a updated task'
    click_button 'Update Task'

    within("div#task_#{@task.id}") do
      expect(page).to have_content('a updated task')
    end
  end


  scenario 'delete task', js: true do
    within("#list_#{@list.id}") do
      within("#task_#{@task.id} .actions") do
        click_link 'delete'
      end
    end

    within("#list_#{@list.id}") do
      within("#tasks") do
        expect(page).not_to have_content("div#task_#{@task.id}")
      end
    end
  end
end
