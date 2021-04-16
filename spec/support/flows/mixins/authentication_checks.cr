module AuthenticationChecks

  def should_have_password_error
    el("body", text: "Password is wrong").should be_on_page
  end

  def should_see_users_menu_link
    el("@users-menu-link").should be_on_page
  end

  def should_not_see_users_menu_link
    el("@users-menu-link").should_not be_on_page
  end

  def should_have_a_users_list
    el("@user-list").should be_on_page
  end

  def should_be_signed_in
    sign_out_link.should be_on_page
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