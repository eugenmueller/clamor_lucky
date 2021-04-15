require "../spec_helper"

describe "List users" do
  it "list users for admin" do
    admin = UserFactory.create &.email("test@example.com").admin(true)
    flow = AuthenticationFlow.new(admin.email)
    flow.sign_in "password"
    flow.should_be_signed_in

    flow.el("@users-menu-link").should be_on_page
    flow.visit Users::Index
    should_have_a_users_list(flow, admin)
  end

  it "not list users for non admins" do
    user = UserFactory.create
    flow = AuthenticationFlow.new(user.email)
    flow.sign_in "password"
    flow.should_be_signed_in

    flow.el("@users-menu-link").should_not be_on_page
    flow.visit Users::Index
    flow.should have_current_path(Me::Show)
  end
end

private def should_have_a_users_list(flow, user)
  flow.el("@user-list").should have_text(user.email)
end
