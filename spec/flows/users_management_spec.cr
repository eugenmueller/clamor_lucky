require "../spec_helper"

describe "Administativ user management" do
  describe "#index" do
    it "list users for admin" do
      admin = UserFactory.create &.email("test@example.com").admin(true)
      flow = UserManagementFlow.new(admin.email)
      flow.sign_in "password"
      flow.should_be_signed_in
      flow.should_see_users_menu_link
      flow.visit_users
      flow.should_have_a_users_list
    end

    it "don't show the index page for normal users" do
      user = UserFactory.create
      flow = UserManagementFlow.new(user.email)
      flow.sign_in "password"
      flow.should_be_signed_in

      flow.should_not_see_users_menu_link
      flow.visit_users
      flow.should have_current_path(Me::Show)
    end
  end

  describe "#show" do
    it "show user information to admin" do
      admin = UserFactory.create &.email("test@example.com").admin(true)
      another_user = UserFactory.create
      flow = UserManagementFlow.new(admin.email)
      flow.sign_in "password"
      flow.visit_user(another_user)
      flow.should have_current_path(Users::Show.with(another_user.id))
    end

    it "don't show user information to non admin users" do
      user = UserFactory.create
      another_user = UserFactory.create
      flow = UserManagementFlow.new(user.email)
      flow.sign_in "password"
      
      flow.visit_user(another_user)
      flow.should have_current_path(Me::Show)
    end
  end
end
