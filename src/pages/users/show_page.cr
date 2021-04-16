class Users::ShowPage < MainLayout
  needs user : User

  def page_title
    "User-#{user.id}"
  end

  def content
    div class: "container-fluid" do
      text user.email
    end
  end
end
