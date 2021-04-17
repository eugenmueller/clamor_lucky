class Users::Show < BrowserAction
  before require_admin

  get "/users/:id" do
    user = fetch_user(id)
    user_with_chats = UserQuery.preload_chats(user)

    if user_with_chats
      html ShowPage, user: user_with_chats
    else
      flash.info = "User not found."
      redirect to: Users::Index
    end
  end

  memoize def fetch_user(id : String) : User
    UserQuery.new.find(id)
  end
end
