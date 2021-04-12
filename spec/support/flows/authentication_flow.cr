class AuthenticationFlow < BaseFlow
  private getter email

  def initialize(@email : String)
  end

  def sign_up(password)
    visit SignUps::New
    fill_form SignUpUser,
      email: email,
      password: password,
      password_confirmation: password
    click "@sign-up-button"
  end

  def sign_out
    visit Me::Show
    sign_out_link.click
  end

  def sign_in(password)
    visit SignIns::New
    fill_form SignInUser,
      email: email,
      password: password
    sign_in_button.click
  end

  def should_be_signed_in
    sign_out_link.should be_on_page
  end

  def should_have_password_error
    el("body", text: "Password is wrong").should be_on_page
  end

  private def sign_in_link
    el("@sign-in-link")
  end

  private def sign_out_link
    el("@sign-out-link")
  end

  private def sign_out_button
    el("@sign-out-button")
  end

  private def sign_in_button
    el("@sign-in-button")
  end
end
