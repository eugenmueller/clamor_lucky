class Chats::Create < BrowserAction
  before require_admin

  post "/chats" do
    SaveChat.create(params, user_id: current_user.id) do |operation, chat|
      if chat
        redirect to: Users::Show.with(current_user)
      else
        html Chats::NewPage, operation: operation
      end
    end
  end
end
