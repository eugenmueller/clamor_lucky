class Users::IndexPage < MainLayout
  needs users : UserQuery

  def page_title
    "Users"
  end

  def content
    render_user_list
    render_new_user_button
  end

  private def render_new_user_button
    link "New User", to: Users::New
  end

  private def render_user_list
    ul class: "user-list" do
      @users.each do |user|
        li do
          link user.id, to: Users::Show.with(user.id)
          text "-"
          text user.email || "No Email"
          # text user.created_at || "No Nickname"
        end
      end
    end
  end
end