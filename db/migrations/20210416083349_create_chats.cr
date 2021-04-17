class CreateChats::V20210416083349 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Chat) do
      primary_key id : Int64
      add_timestamps
      add name : String
      add_belongs_to creator : User, on_delete: :do_nothing
    end
  end

  def rollback
    drop table_for(Chat)
  end
end
