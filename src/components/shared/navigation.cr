class Shared::Navigation < BaseComponent
  needs context : HTTP::Server::Context
  needs current_user : User?

  def render
    nav class: "container-fluid navbar navbar-expand-lg navbar-light bg-light" do
      link "Clamor-Admin", to: Users::Index, class: "navbar-brand"

      button aria_controls: "navbarText", aria_expanded: "false", aria_label: "Toggle navigation", class: "navbar-toggler", data_bs_target: "#navbarText", data_bs_toggle: "collapse", type: "button" do
        span class: "navbar-toggler-icon"
      end
      div class: "collapse navbar-collapse", id: "navbarText" do
        ul class: "navbar-nav me-auto mb-2 mb-lg-0" do
          li class: "nav-item" do
            link "Users",
              to: Users::Index,
              data_selected: current_page?(Users::Index),
              class: "nav-link #{current_page?(Users::Index) ? "active" : ""}"
          end
        end
        span class: "navbar-text" do
          render_signed_in_user
        end
      end
    end
  end

  private def render_signed_in_user
    if current_user.nil?
      link "Sign in", to: SignIns::New, flow_id: "sign-in-lik"
    else
      text current_user.try(&.email) || "oo"
      text " - "
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-link"
    end
  end
end
