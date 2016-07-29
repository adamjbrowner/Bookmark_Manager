feature 'Resseting password' do
  scenario 'User asks for password recovery' do
    visit '/sessions/new'
    click_link 'Forgot my password'
    expect(page).to have_content 'Please enter your email'
  end

  scenario 'User can submit email for password recoveryand receieve confirmation' do
    sign_up
    visit '/users/reset'
    fill_in :email, with: 'example@email.com'
    click_button 'Submit'
    expect(page).to have_content "Please check your email"
  end
end
