class Users::ShowPage < MainLayout
  needs user : User

  def content
    div class: "container-fluid" do
      hr
      div class: "d-flex" do
        div class: "flex-schrink-0" do
          # img src: "...", alt: ""
          button type: "button", class: "btn btn-info btn-lg" do
            strong user.email[0, 1].upcase
          end
        end
        div class: "flex-grow-1 ms-3" do
          strong do
            text user.email
          end
        end
      end
      hr
      h3 "Chats"
      div class: "list-group list-group-numbered" do
        user.chats.each do |chat|
          li class: "list-group-item d-flex justify-content-between align-items-start" do
            div class: "ms-2 me-auto" do
              strong chat.name
            end
            span class: "badge bg-info rounded-pill" do
              text 42
            end
          end
        end
      end
      div class: "button-group" do
        link "New Chat", to: Chats::New, class: "btn btn-primary"
      end
    end
  end
end
