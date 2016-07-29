feature "Signing in" do
  scenario "User correctly signs in" do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: "example@email.com"
    fill_in :password, with: "password"
    click_button "Sign in"
    expect(page).to have_content("Welcome, example@email.com")
  end
end
