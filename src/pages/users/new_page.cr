class Users::NewPage < MainLayout
  def content
    br

    button "Click to toggle popover", class: "btn btn-lg btn-danger", data_bs_content: "And here's some amazing content. It's very engaging. Right?", data_bs_toggle: "popover", title: "Popover title", type: "button"
    br
    
    button class: "btn btn-primary", data_bs_target: "#exampleModal", data_bs_toggle: "modal", type: "button" do
      text " Launch demo modal "
    end
    div aria_hidden: "true", aria_labelledby: "exampleModalLabel", class: "modal fade", id: "exampleModal", tabindex: "-1" do
      div class: "modal-dialog" do
        div class: "modal-content" do
          div class: "modal-header" do
            h5 "Modal title", class: "modal-title", id: "exampleModalLabel"
            button aria_label: "Close", class: "btn-close", data_bs_dismiss: "modal", type: "button"
          end
          div class: "modal-body" do
            text " ... "
          end
          div class: "modal-footer" do
            button "Close", class: "btn btn-secondary", data_bs_dismiss: "modal", type: "button"
            button "Save changes", class: "btn btn-primary", type: "button"
          end
        end
      end
    end

  end
end