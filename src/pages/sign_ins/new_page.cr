class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def content
    div class: "row align-items-center", style: "height: 95vh;" do
      div class: "col"
      div class: "col" do
        div class: "card shadow" do
          div class: "card-header" do
            h1 "Sign In"
          end
          div class: "card-body" do
            render_sign_in_form(@operation)
          end
        end
      end
      div class: "col"
    end
  end

  private def render_sign_in_form(op)
    form_for SignIns::Create do
      sign_in_fields(op)
      div class: "mb-3" do
        submit "Sign In", flow_id: "sign-in-button", class: "btn btn-primary"
      end
    end
    link "Reset password", to: PasswordResetRequests::New
    text " | "
    link "Sign up", to: SignUps::New
  end

  private def sign_in_fields(op)
    div class: "mb-3" do
      mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true")
    end
    div class: "mb-3" do
      mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input
    end
  end
end
