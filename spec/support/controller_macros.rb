module ControllerMacros
  def login_user
    let(:user) { User.create(email: "user@social.com", password: "12345678") }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end
end
