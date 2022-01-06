shared_context "current user signed in" do
  background do
    create :user, email: "test@test.com", password: "100100", firstname: "Test", lastname: "test"

    sign_in("test@test.com", "100100")
  end

  let(:current_user) { User.find_by(email: "test@test.com") }
end
