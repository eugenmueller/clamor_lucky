require "../spec_helper"

describe "List users" do
  it "list users" do
    user = UserFactory.create
    flow = AuthenticationFlow.new(user.email)
    flow.sign_in "password"
    flow.should_be_signed_in

    flow.visit Users::Index
    should_have_a_users_list(flow, user)
  end
end

private def should_have_a_users_list(flow, user)
  flow.el("@user-list").should have_text(user.email)
end
