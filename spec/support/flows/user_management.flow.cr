require "./mixins/authentication_checks"

class UserManagementFlow < BaseFlow
  include AuthenticationChecks

  private getter email

  def initialize(@email : String)
  end

  def sign_in(password)
    visit SignIns::New
    fill_form SignInUser,
      email: email,
      password: password
    sign_in_button.click
  end

  def visit_users
    visit Users::Index
  end

  def visit_user(user)
    visit Users::Show.with(user.id)
  end 
end