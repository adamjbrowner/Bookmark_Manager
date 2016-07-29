describe User do
  let!(:user) do
    User.create(email: 'example@email.com', password: 'password', password_confirmation: 'password')
  end
  it '#authenticates user email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'Does not authenticate with an incorrect password' do
    expect(User.authenticate(user.email, password: 'wrong_stupid_password')).to be_nil
  end
end
