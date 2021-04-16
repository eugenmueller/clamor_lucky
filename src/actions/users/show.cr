class Users::Show < BrowserAction
  before require_admin

  get "/users/:id" do
    user = fetch_user(id)
    if user
      html ShowPage, user: user
    else
      flash.info = "User not found."
      redirect to: Users::Index
    end
  end

  memoize def fetch_user(id : String) : User
    UserQuery.new.find(id)
  end
end
