module Soshi
  module MarkdownHelper
    def markdown(text)
      renderer_options = {
        hard_wrap: true,
        xhtml: true,
      }
      renderer = Redcarpet::Render::HTML.new(renderer_options)

      extensions = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        lax_html_blocks: true,
        strikethrough: true
      }

      markdown = Redcarpet::Markdown.new(renderer, extensions)
      markdown.render(text)
    end
  end
end