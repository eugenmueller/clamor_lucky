class SaveChat < Chat::SaveOperation
  needs user_id : Int64

  before_save assign_creator_id
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  # permit_columns name
  permit_columns name

  def assign_creator_id
    creator_id.value = user_id
  end
end
