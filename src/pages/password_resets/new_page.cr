class PasswordResets::NewPage < AuthLayout
  needs operation : ResetPassword
  needs user_id : Int64

  def content
    div class: "row align-items-center", style: "height: 95vh;" do
      div class: "col"
      div class: "col" do
        div class: "card shadow" do
          div class: "card-header" do
            h1 "Reset your password"
          end
          div class: "card-body" do
            render_password_reset_form(@operation)
          end
        end
      end
      div class: "col"
    end
  end

  private def render_password_reset_form(op)
    form_for PasswordResets::Create.with(@user_id) do
      div class: "mb-3" do
        mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input(autofocus: "true")
      end
      div class: "mb-3" do
        mount Shared::Field, attribute: op.password_confirmation, label_text: "Confirm Password", &.password_input
      end
      div class: "mb-3" do
        submit "Update Password", flow_id: "update-password-button", class: "btn btn-primary"
      end
    end
  end
end
