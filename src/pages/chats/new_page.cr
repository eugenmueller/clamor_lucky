class Chats::NewPage < MainLayout
  needs operation : SaveChat

  def content
    div class: "container" do
      render_create_form(@operation)
    end
  end

  private def render_create_form(op)
    form_for Chats::Create do
      div class: "mb-3" do
        mount Shared::Field, attribute: op.name, label_text: "Name"
      end
      div class: "mb-3" do
        submit "Create", flow_id: "create-chat-button", class: "btn btn-primary"
      end
    end
  end
end
