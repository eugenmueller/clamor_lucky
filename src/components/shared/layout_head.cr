class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    
    head do
      utf8_charset
      title "My App - #{@page_title}"
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      # css_link "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css", rel: "stylesheet", integrity: "sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6", crossorigin: "anonymous"
      # js_link "https://code.jquery.com/jquery-3.5.1.slim.min.js", integrity: "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj", crossorigin: "anonymous"
      # js_link "https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/esm/popper.min.js", integrity: "sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG", crossorigin: "anonymous"
      # js_link "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js", integrity: "sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc", crossorigin: "anonymous"
      
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
