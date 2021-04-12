class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      if flash_type == "failure"
        div class: "alert alert-danger", flow_id: "flash", role: "alert" do
          text flash_message
        end
      else
        div class: "alert alert-#{flash_type}", flow_id: "flash", role: "alert" do
          text flash_message
        end
      end
    end
  end
end
