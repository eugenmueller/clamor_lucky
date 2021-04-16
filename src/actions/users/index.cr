class Users::Index < BrowserAction
  before require_admin

  route do
    users = UserQuery.new
    html IndexPage, users: users
  end
end
