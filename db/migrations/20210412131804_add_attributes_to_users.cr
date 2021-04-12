class AddAdminToUsers::V20210412131804 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add admin : Bool, default: false
      add login_count : Int32, default: 0
    end
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    # create table_for(Thing) do
    #   primary_key id : Int64
    #   add_timestamps
    #
    #   add title : String
    #   add description : String?
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
  end

  def rollback
    alter table_for(User) do
      remove :admin
      remove :login_count
    end
    # drop table_for(Thing)
  end
end
