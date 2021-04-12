class Api::Users::Index < ApiAction
  get "/api/users" do
    all_users = UserQuery.new
    json UserSerializer.for_collection(all_users)
  end
end
