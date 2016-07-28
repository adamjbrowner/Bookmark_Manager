require "web_helper"

# We don't actually test that password matches confirmation:
feature "Signing up" do

  scenario "Users can't sign up with a blank email address" do
    expect {sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario "Users can't sign up with an invalid email adress" do
    expect {sign_up(email: "invalid@email")}.not_to change(User, :count)
  end
  scenario "signs up a new user with passwords entered correctly" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, example@email.com")
    user = User.first
    expect(user.email).to eq("example@email.com")
  end

  scenario "no new users created for mismatching passwords" do
    expect { sign_up(password_confirmation: 'wrong_pasword') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password and confirmation password do not match")
  end
end
