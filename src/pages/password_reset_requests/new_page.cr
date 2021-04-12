class PasswordResetRequests::NewPage < AuthLayout
  needs operation : RequestPasswordReset

  def content
    div class: "row align-items-center", style: "height: 95vh;" do
      div class: "col"
      div class: "col" do
        div class: "card shadow" do
          div class: "card-header" do
            h1 "Reset your password"
          end
          div class: "card-body" do
            render_form(@operation)
          end
        end
      end
      div class: "col"
    end
  end

  private def render_form(op)
    form_for PasswordResetRequests::Create do
      div class: "mb-3" do
        mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input
      end
      div class: "mb-3" do
        submit "Reset Password", flow_id: "request-password-reset-button", class: "btn btn-primary"
      end
    end
  end
end
