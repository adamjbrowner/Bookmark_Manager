feature "Sign out" do
  scenario "User signs out" do
      sign_up
      sign_in
      click_button "Sign out"
      expect(page).to have_content "Goodbye!"
      expect(current_path).to eq "/links"
  end
end
