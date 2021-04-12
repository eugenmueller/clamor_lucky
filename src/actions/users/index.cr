class Users::Index < BrowserAction
  route do
    users = UserQuery.new
    html IndexPage, users: users
  end
end