class Chats::New < BrowserAction
  before require_admin

  get "/chats/new" do
    html NewPage, operation: SaveChat.new(user_id: current_user.id)
  end
end
