class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    div class: "row align-items-center", style: "height: 95vh;" do
      div class: "col"
      div class: "col" do
        div class: "card shadow" do
          div class: "card-header" do
            h1 "Sign Up"
          end
          div class: "card-body" do
            render_sign_up_form(@operation)
          end
        end
      end
      div class: "col"
    end
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      div class: "mb-3" do
        submit "Sign Up", flow_id: "sign-up-button", class: "btn btn-primary"
      end
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(op)
    div class: "mb-3" do
      mount Shared::Field, attribute: op.email, label_text: "Email", &.email_input(autofocus: "true")
    end
    div class: "mb-3" do
      mount Shared::Field, attribute: op.password, label_text: "Password", &.password_input
    end
    div class: "mb-3" do
      mount Shared::Field, attribute: op.password_confirmation, label_text: "Confirm Password", &.password_input
    end
  end
end
