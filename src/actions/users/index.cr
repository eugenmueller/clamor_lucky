class Users::Index < BrowserAction
  include Authorization::RequireAdmin

  route do
    users = UserQuery.new
    html IndexPage, users: users
  end
end
