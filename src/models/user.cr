class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
    column admin : Bool = false

    has_many chats : Chat, foreign_key: "creator_id"
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
