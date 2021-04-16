class Users::Show < BrowserAction
  include Authorization::RequireAdmin

  route do
    html ShowPage
  end
end
