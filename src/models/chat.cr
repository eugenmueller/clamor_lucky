class Chat < BaseModel
  table do
    column name : String
    belongs_to creator : User
  end
end
